import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:windows1251/windows1251.dart';

import './fetch_cache.dart';
import './utils.dart';

/// encoders supported locally by this implementation
const Map<String, Encoding> localEncoders = {'windows-1251': Windows1251Codec()};

/// default user agent
const userAgent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:106.0) Gecko/20100101 Firefox/106.0';

/// http retry codes
const retryCodes = {408, 429, 500, 502, 503, 504, 522, 524, 599};

/// Fetcher implementation
class Fetcher extends http.BaseClient {
  late final http.Client _inner;
  Logger? log;

  /// Fetcher constructor
  Fetcher({http.Client? inner, this.log}) {
    _inner = inner ?? _retryClient();
  }

  http.Client _retryClient() {
    return RetryClient(
      http.Client(),
      when: (r) => retryCodes.contains(r.statusCode),
    );
  }

  ///
  Future<FetcherResponse> fetch(Uri uri, FetchCache? cache) async {
    if (cache?.isNotExpired() ?? false) {
      log?.finer('cache hit ${cache!.expires}');
      return FetcherResponse(
        result: FetchResultType.notModified,
        url: uri,
        message: 'cached response',
      );
    }

    final req = makeRequest(uri, cache);
    http.Response res;

    try {
      final rr = send(req).timeout(const Duration(seconds: 20));
      res = await http.Response.fromStream(await rr);
    } on TimeoutException {
      return FetcherResponse(
        result: FetchResultType.error,
        url: uri,
        message: 'Request timeout',
      );
    } catch (e) {
      return FetcherResponse(
        result: FetchResultType.error,
        url: uri,
        message: e.toString(),
      );
    }

    if (res.statusCode > 399) {
      var message = 'Request to $uri failed with status ${res.statusCode}';
      if (res.reasonPhrase != null) {
        message = '$message: ${res.reasonPhrase}';
      }
      return FetcherResponse(
        result: FetchResultType.error,
        url: res.request?.url ?? uri,
        message: message,
      );
    }

    if (res.statusCode == 304 && res.contentLength == 0) {
      return FetcherResponse(
        result: FetchResultType.notModified,
        url: res.request?.url ?? uri,
        message: 'cached response',
      );
    }

    if (res.contentLength == 0) {
      return FetcherResponse(
        result: FetchResultType.error,
        url: res.request?.url ?? uri,
        message: 'feed content is empty',
      );
    }

    final encoder = resolveEncoderFromHeaders(res.headers);

    final decodedBody = tryOrNull<String>(() => encoder.decode(res.bodyBytes));
    if (decodedBody == null) {
      return FetcherResponse(
        result: FetchResultType.error,
        url: res.request?.url ?? uri,
        message: 'error decoding content',
      );
    }

    // res.headers.forEach((header, value) {
    //   if (header != 'set-cookie') {
    //     stdout.writeln('$header: ${res.headers[header]}');
    //   }
    // });

    return FetcherResponse(
      result: FetchResultType.success,
      body: decodedBody,
      url: res.request?.url ?? uri,
      cache: makeCache(res),
    );
  }

  ///
  Encoding resolveEncoderFromHeaders(Map<String, String> headers) {
    return _encodingFromCharset(_contentTypeFromHeaders(headers).parameters['charset']);
  }

  ///
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }

  ///
  MediaType _contentTypeFromHeaders(Map<String, String> headers) {
    final contentType = headers['content-type'];
    if (contentType != null) return MediaType.parse(contentType);
    return MediaType('application', 'octet-stream');
  }

  ///
  Encoding _encodingFromCharset(String? charset, [Encoding fallback = utf8]) {
    final enc = Encoding.getByName(charset);
    if (enc != null) return enc;

    return localEncoders[charset] ?? fallback;
  }

  http.Request makeRequest(Uri uri, FetchCache? cache) {
    final req = http.Request('GET', uri)
      ..persistentConnection = false
      ..followRedirects = true
      ..maxRedirects = 4;

    if (cache != null) {
      if (cache.etag.isNotEmpty) {
        req.headers['if-none-match'] = cache.etag;
      }
      if (cache.lastModified.isNotEmpty) {
        req.headers['if-modified-since'] = cache.lastModified;
      }
    }

    return req;
  }

  FetchCache makeCache(http.Response res) {
    DateTime? expires;
    if (res.headers['expires'] != null) {
      expires = FetchCache.parseDate(res.headers['expires']!)?.toUtc();
    } else if (res.headers['cache-control'] != null) {
      expires = dateFromCacheControl(res.headers);
    }

    return FetchCache(
      res.headers['etag'] ?? '',
      res.headers['last-modified'] ?? '',
      expires,
    );
  }

  DateTime? dateFromCacheControl(Map<String, String> headers) {
    final cc = headers['cache-control'];
    if (cc == null) return null;

    final parts = cc.split(',').map((e) => e.trim().split('=')).toList();
    final maxAge = parts.firstWhere((e) => e.first == 'max-age', orElse: () => ['0', '0']).last;
    final maxAgeInt = int.tryParse(maxAge);
    if (maxAgeInt == null) return null;

    final headerDateStr = headers['date'];
    final headerDate = (headerDateStr == null) ? DateTime.now().toUtc() : FetchCache.parseDate(headerDateStr);
    if (headerDate == null) return null;

    return headerDate.add(Duration(seconds: maxAgeInt));
  }
}

enum FetchResultType { success, error, notModified }

/// Response data returned
class FetcherResponse {
  /// FetcherResponse constructor
  FetcherResponse({
    required this.result,
    required this.url,
    this.message = '',
    this.body = '',
    this.cache,
  });

  /// response status
  final FetchResultType result;

  /// if success is false, this is the error message
  final String message;

  /// if success is true, this is the response content
  final String body;

  /// url used to make the fetch
  final Uri url;

  /// cache object that could be used on the next request
  FetchCache? cache;
}
