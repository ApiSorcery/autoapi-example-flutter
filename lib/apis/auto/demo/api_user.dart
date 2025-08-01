import 'base.dart';
import 'model.dart';

/// User
class ApiUser {
  /// Add user
  static Future<double> addUser(UserAddRequestDto req) async {
    var response = await createJsonRequest(
      url: '/user',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return response.data;
  }

  /// Batch export users (Excel)
  static Future<BlobResp?> exportUsers(ExportUsersRequest req) async {
    var response = await createDownloadRequest(
      url: '/user/export',
      method: 'GET',
      queryParameters: {'code': req.code,'name': req.name,'email': req.email},
    );
    return response.data;
  }

  /// Get single user
  static Future<UserInfoDto> getUserOne(GetUserOneRequest req) async {
    var response = await createJsonRequest(
      url: '/user/${req.id}',
      method: 'GET',
    );
    return UserInfoDto.fromJson(response.data);
  }

  /// Query user list with pagination
  static Future<GetUserPagedResponse> getUserPaged(UserPageQueryDto req) async {
    var response = await createJsonRequest(
      url: '/user/paged',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return GetUserPagedResponse.fromJson(response.data);
  }

  /// Modify user information
  static Future modifyUser(UserModifyRequestDto req) async {
    await createJsonRequest(
      url: '/user',
      method: 'PATCH',
      contentType: 'application/json',
      data: req.toJson()
    );
  }

  /// Delete user
  static Future removeUser(RemoveUserRequest req) async {
    await createJsonRequest(
      url: '/user/${req.id}',
      method: 'DELETE',
    );
  }

  /// Validate if user code exists
  static Future<bool> validateCode(ValidateCodeRequest req) async {
    var response = await createJsonRequest(
      url: '/user/validateCode',
      method: 'GET',
      queryParameters: {'code': req.code},
    );
    return response.data;
  }

  /// Validate if user email exists
  static Future<bool> validateEmail(ValidateEmailRequest req) async {
    var response = await createJsonRequest(
      url: '/user/validateEmail',
      method: 'GET',
      queryParameters: {'email': req.email},
    );
    return response.data;
  }

}