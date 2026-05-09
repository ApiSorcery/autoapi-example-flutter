import 'base.dart';
import 'model.dart';

/// User
class ApiUser {
  /// Add user
  static Future addUser(UserAddRequestDto req) async {
    await createJsonRequest(
      url: '/user',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
  }

  /// Batch export users (Excel)
  static Future exportUsers(ExportUsersRequest req) async {
    await createJsonRequest(
      url: '/user/export',
      method: 'GET',
      queryParameters: {'code': req.code,'name': req.name,'email': req.email},
    );
  }

  /// Get single user
  static Future getUserOne(GetUserOneRequest req) async {
    await createJsonRequest(
      url: '/user/${req.id}',
      method: 'GET',
    );
  }

  /// Query user list with pagination
  static Future getUserPaged(UserPageQueryDto req) async {
    await createJsonRequest(
      url: '/user/paged',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
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
  static Future validateCode(ValidateCodeRequest req) async {
    await createJsonRequest(
      url: '/user/validateCode',
      method: 'GET',
      queryParameters: {'code': req.code},
    );
  }

}