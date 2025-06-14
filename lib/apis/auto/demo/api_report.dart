import 'base.dart';
import 'model.dart';

/// 统计管理
class ApiReport {
  /// 获取按日统计数据
  static Future<ReportResponseDto> getReportDay(ReportQueryRequestDto req) async {
    var response = await createJsonRequest(
      url: '/report/day',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return ReportResponseDto.fromJson(response.data);
  }

  /// 获取按小时统计数据
  static Future<ReportResponseDto> getReportHour(ReportQueryRequestDto req) async {
    var response = await createJsonRequest(
      url: '/report/hour',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return ReportResponseDto.fromJson(response.data);
  }

  /// 获取按分钟统计数据
  static Future<ReportResponseDto> getReportMinute(ReportQueryRequestDto req) async {
    var response = await createJsonRequest(
      url: '/report/minute',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return ReportResponseDto.fromJson(response.data);
  }

}