/// Generic callback
typedef GenCallback<T> = T Function();

T? tryOrNull<T>(GenCallback<T> cb) {
  try {
    return cb();
  } catch (e) {
    return null;
  }
}

extension StringExt on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String take(int n) {
    return substring(0, length > n ? n : length);
  }
}

// function to parse a date like 2023-06-30T00:10:15.000Z to a time ago
// format like 2h, 3d, 1w, 2m, 1y
String timeAgo(String date) {
  final now = DateTime.now().toUtc();
  final dt = DateTime.parse(date).toUtc();
  final diff = now.difference(dt);

  if (diff.inDays > 365) {
    return '${(diff.inDays / 365).floor()}Y';
  } else if (diff.inDays > 30) {
    return '${(diff.inDays / 30).floor()}M';
  } else if (diff.inDays > 7) {
    return '${(diff.inDays / 7).floor()}w';
  } else if (diff.inDays > 0) {
    return '${diff.inDays}d';
  } else if (diff.inHours > 0) {
    return '${diff.inHours}h';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes}m';
  } else {
    return '${diff.inSeconds}s';
  }
}
