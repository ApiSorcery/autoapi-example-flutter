import 'base.dart';
import 'model.dart';

/// 应用管理
class ApiApplication {
  /// 新增应用
  static Future<double> addApplication(ApplicationAddRequestDto req) async {
    var response = await createJsonRequest(
      url: '/application',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return response.data;
  }

  /// 获取应用详情
  static Future<ApplicationResponseDto> getApplicationInfo(GetApplicationInfoRequest req) async {
    var response = await createJsonRequest(
      url: '/application/${req.id}',
      method: 'GET',
    );
    return ApplicationResponseDto.fromJson(response.data);
  }

  /// 获取应用列表（所有）
  static Future<List<ApplicationResponseDto>?> getApplicationList() async {
    var response = await createNoParamsJsonRequest(
      url: '/application/list',
      method: 'GET'
    );
    return (response.data as List?)?.map((e) => ApplicationResponseDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 获取应用列表（分页）
  static Future<GetApplicationPagedResponse> getApplicationPaged(ApplicationQueryRequestDto req) async {
    var response = await createJsonRequest(
      url: '/application/paged',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return GetApplicationPagedResponse.fromJson(response.data);
  }

  /// 修改应用
  static Future modifyApplication(ApplicationEditRequestDto req) async {
    await createJsonRequest(
      url: '/application',
      method: 'PATCH',
      contentType: 'application/json',
      data: req.toJson()
    );
  }

  /// 删除应用
  static Future removeApplication(RemoveApplicationRequest req) async {
    await createJsonRequest(
      url: '/application/${req.id}',
      method: 'DELETE',
    );
  }

}