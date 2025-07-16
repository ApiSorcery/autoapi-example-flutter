import 'package:intl/intl.dart';

class DateTimeUtil {
  /// 格式化时间(东八区)
  static String formatDateTime(String initialDateStr) {
    var datetimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    // 转换为UTC时间，然后加8小时
    var dateTime =
        DateTime.parse(initialDateStr).toUtc().add(const Duration(hours: 8));
    return datetimeFormat.format(dateTime);
  }

/// 格式化日期(东八区)
  static String formatDate(String initialDateStr) {
    var dateFormat = DateFormat('yyyy-MM-dd');
    // 转换为UTC时间，然后加8小时
    var dateTime =
        DateTime.parse(initialDateStr).toUtc().add(const Duration(hours: 8));
    return dateFormat.format(dateTime);
  }
}
