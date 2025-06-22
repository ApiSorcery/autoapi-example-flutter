import 'base.dart';
import 'model.dart';

/// 用户管理
class ApiUser {
  /// 新增用户
  static Future<double> addUser(User req) async {
    var response = await createJsonRequest(
      url: '/user',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return response.data;
  }

  /// 批量导出用户（Excel）
  static Future<BlobResp?> exportUsers(ExportUsersRequest req) async {
    var response = await createDownloadRequest(
      url: '/user/export',
      method: 'GET',
      queryParameters: {'code': req.code,'name': req.name,'email': req.email},
    );
    return response.data;
  }

  /// 获取登录用户信息
  static Future<UserInfoResponseDto> getLoginUserInfo() async {
    var response = await createNoParamsJsonRequest(
      url: '/user/info',
      method: 'GET'
    );
    return UserInfoResponseDto.fromJson(response.data);
  }

  /// 获取单个用户
  static Future<User> getUserOne(GetUserOneRequest req) async {
    var response = await createJsonRequest(
      url: '/user/${req.id}',
      method: 'GET',
    );
    return User.fromJson(response.data);
  }

  /// 分页查询用户列表
  static Future<GetUserPageResponse> getUserPage(UserPageQueryDto req) async {
    var response = await createJsonRequest(
      url: '/user/paged',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return GetUserPageResponse.fromJson(response.data);
  }

  /// 修改用户信息
  static Future modifyUser() async {
    await createNoParamsJsonRequest(
      url: '/user',
      method: 'PATCH'
    );
  }

  /// 删除用户
  static Future removeUser(RemoveUserRequest req) async {
    await createJsonRequest(
      url: '/user/${req.id}',
      method: 'DELETE',
    );
  }

  /// 校验用户编号是否存在
  static Future<bool> validateCode(ValidateCodeRequest req) async {
    var response = await createJsonRequest(
      url: '/user/validateCode',
      method: 'GET',
      queryParameters: {'code': req.code},
    );
    return response.data;
  }

  /// 校验用户邮箱是否存在
  static Future<UserInfoResponseDto> validateEmail(ValidateEmailRequest req) async {
    var response = await createJsonRequest(
      url: '/user/validateEmail',
      method: 'GET',
      queryParameters: {'email': req.email},
    );
    return UserInfoResponseDto.fromJson(response.data);
  }

}