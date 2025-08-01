import 'package:intl/intl.dart';

class DateTimeUtil {
  /// Format datetime (UTC+8)
  static String formatDateTime(String initialDateStr) {
    var datetimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    // Convert to UTC time, then add 8 hours
    var dateTime =
        DateTime.parse(initialDateStr).toUtc().add(const Duration(hours: 8));
    return datetimeFormat.format(dateTime);
  }

/// Format date (UTC+8)
  static String formatDate(String initialDateStr) {
    var dateFormat = DateFormat('yyyy-MM-dd');
    // Convert to UTC time, then add 8 hours
    var dateTime =
        DateTime.parse(initialDateStr).toUtc().add(const Duration(hours: 8));
    return dateFormat.format(dateTime);
  }
}
