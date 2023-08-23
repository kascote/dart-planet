import 'dart:convert';
import 'package:intl/intl.dart';

final df = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

class FetchCache {
  String etag = '';
  String lastModified = '';
  DateTime? expires;

  FetchCache(this.etag, this.lastModified, DateTime? expires) {
    if (expires != null) {
      this.expires = expires.toUtc();
    }
  }

  FetchCache.blank() {
    etag = '';
    lastModified = '';
  }

  FetchCache.fromJson(Map<String, dynamic> json) {
    etag = json['etag'] != null ? json['etag'] as String : '';
    lastModified = json['lastModified'] != null ? json['lastModified'] as String : '';
    if (json['expires'] != null) {
      final exp = json['expires'] as String;
      expires = exp.trim().isNotEmpty ? parseDate(exp) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['etag'] = etag;
    data['lastModified'] = lastModified;
    data['expires'] = expires != null ? df.format(expires!) : '';
    return data;
  }

  bool isExpired() {
    if (expires == null) return false;
    return DateTime.now().toUtc().isAfter(expires!);
  }

  bool isNotExpired() {
    if (expires == null) return false;
    return DateTime.now().toUtc().isBefore(expires!);
  }

  @override
  String toString() => json.encode(toJson());

  static DateTime? parseDate(String date) {
    try {
      return df.parseUtc(date);
    } catch (e) {
      return null;
    }
  }

  static FetchCache? fromString(String jsonString) {
    if (jsonString.trim().isEmpty) return null;

    return FetchCache.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  }
}
