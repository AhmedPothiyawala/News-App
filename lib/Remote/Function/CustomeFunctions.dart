String formatRelativeTime(Duration duration) {
  if (duration.inMinutes <= 60) {
    return '${duration.inMinutes} minute ago';
  } else if (duration.inHours <= 24) {
    return '${duration.inHours} hour ago';
  } else if (duration.inDays > 0) {
    return '${duration.inDays} day ago';
  } else {
    return 'Just now';
  }
}
