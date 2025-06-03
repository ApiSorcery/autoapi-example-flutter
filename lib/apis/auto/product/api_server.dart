import 'base.dart';
import 'model.dart';

/// 服务管理
class ApiServer {
  /// 新增服务
  static Future<double> addServer(ServerAddRequestDto req) async {
    var response = await createJsonRequest(
      url: '/server',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return response.data;
  }

  /// 获取服务详情
  static Future<ServerResponseDto> getServerInfo(GetServerInfoRequest req) async {
    var response = await createJsonRequest(
      url: '/server/${req.id}',
      method: 'GET',
    );
    return ServerResponseDto.fromJson(response.data);
  }

  /// 获取应用列表（所有）
  static Future<List<ServerResponseDto>?> getServerList() async {
    var response = await createNoParamsJsonRequest(
      url: '/server/list',
      method: 'GET'
    );
    return (response.data as List?)?.map((e) => ServerResponseDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 获取服务列表（分页）
  static Future<GetServerPagedResponse> getServerPaged(ServerQueryRequestDto req) async {
    var response = await createJsonRequest(
      url: '/server/paged',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return GetServerPagedResponse.fromJson(response.data);
  }

  /// 修改服务
  static Future modifyServer(ServerEditRequestDto req) async {
    await createJsonRequest(
      url: '/server',
      method: 'PATCH',
      contentType: 'application/json',
      data: req.toJson()
    );
  }

  /// 删除服务
  static Future removeServer(RemoveServerRequest req) async {
    await createJsonRequest(
      url: '/server/${req.id}',
      method: 'DELETE',
    );
  }

}