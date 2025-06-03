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

  /// 获取用户信息
  static Future<UserInfoResponseDto> getUserInfo() async {
    var response = await createNoParamsJsonRequest(
      url: '/user',
      method: 'GET'
    );
    return UserInfoResponseDto.fromJson(response.data);
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

  /// 校验用户邮箱是否存在
  static Future<UserInfoResponseDto> validateEmail(ValidateEmailRequest req) async {
    var response = await createJsonRequest(
      url: '/user/validateEmail',
      method: 'GET',
      queryParameters: {'email': req.email},
    );
    return UserInfoResponseDto.fromJson(response.data);
  }

  /// 校验用户昵称是否存在
  static Future<bool> validateNickName(ValidateNickNameRequest req) async {
    var response = await createJsonRequest(
      url: '/user/validateNickName',
      method: 'GET',
      queryParameters: {'nickName': req.nickName},
    );
    return response.data;
  }

}