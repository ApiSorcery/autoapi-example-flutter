import 'package:json_annotation/json_annotation.dart';
import 'dart:typed_data';

part 'model.g.dart';

/// 报文基类
class TBase extends Object {
  Map<String, dynamic> toJson() => {};
}

/// 二进制数据返回类型
class BlobResp extends Object {
  String? type;
  String? name;
  Uint8List? data;
  BlobResp({this.type, this.name, this.data});
}

/// 批量导出用户（Excel）请求参数
@JsonSerializable()
class ExportUsersRequest extends TBase {
  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'email')
  String email;

  ExportUsersRequest(this.code,this.name,this.email);

  factory ExportUsersRequest.fromJson(Map<String, dynamic> srcJson) => _$ExportUsersRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ExportUsersRequestToJson(this);
}

/// 获取单个用户请求参数
@JsonSerializable()
class GetUserOneRequest extends TBase {
  @JsonKey(name: 'id')
  double id;

  GetUserOneRequest(this.id);

  factory GetUserOneRequest.fromJson(Map<String, dynamic> srcJson) => _$GetUserOneRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetUserOneRequestToJson(this);
}

/// 删除用户请求参数
@JsonSerializable()
class RemoveUserRequest extends TBase {
  @JsonKey(name: 'id')
  double id;

  RemoveUserRequest(this.id);

  factory RemoveUserRequest.fromJson(Map<String, dynamic> srcJson) => _$RemoveUserRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$RemoveUserRequestToJson(this);
}

/// 校验用户编号是否存在请求参数
@JsonSerializable()
class ValidateCodeRequest extends TBase {
  @JsonKey(name: 'code')
  String code;

  ValidateCodeRequest(this.code);

  factory ValidateCodeRequest.fromJson(Map<String, dynamic> srcJson) => _$ValidateCodeRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ValidateCodeRequestToJson(this);
}

/// 校验用户邮箱是否存在请求参数
@JsonSerializable()
class ValidateEmailRequest extends TBase {
  @JsonKey(name: 'email')
  String email;

  ValidateEmailRequest(this.email);

  factory ValidateEmailRequest.fromJson(Map<String, dynamic> srcJson) => _$ValidateEmailRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ValidateEmailRequestToJson(this);
}

/// 删除文件请求参数
@JsonSerializable()
class DeleteFileRequest extends TBase {
  /// 文件UUID
  @JsonKey(name: 'id')
  String id;

  DeleteFileRequest(this.id);

  factory DeleteFileRequest.fromJson(Map<String, dynamic> srcJson) => _$DeleteFileRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$DeleteFileRequestToJson(this);
}

/// 获取文件请求参数
@JsonSerializable()
class GetFileRequest extends TBase {
  /// 文件UUID
  @JsonKey(name: 'id')
  String id;

  GetFileRequest(this.id);

  factory GetFileRequest.fromJson(Map<String, dynamic> srcJson) => _$GetFileRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetFileRequestToJson(this);
}

/// 分页查询用户列表请求参数
@JsonSerializable()
class GetUserPageResponse extends TBase {
  @JsonKey(name: 'results')
  List<User>? results;

  @JsonKey(name: 'total')
  double? total;

  GetUserPageResponse(this.results,this.total);

  factory GetUserPageResponse.fromJson(Map<String, dynamic> srcJson) => _$GetUserPageResponseFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetUserPageResponseToJson(this);
}

@JsonSerializable()
class ResultData extends TBase {
  /// 状态码
  @JsonKey(name: 'status')
  double? status;

  /// 状态描述
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  dynamic data;

  ResultData(this.status,this.message,this.data);

  factory ResultData.fromJson(Map<String, dynamic> srcJson) => _$ResultDataFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}

@JsonSerializable()
class UserInfoResponseDto extends TBase {
  /// 用户ID
  @JsonKey(name: 'id')
  double? id;

  /// 用户编号
  @JsonKey(name: 'code')
  String? code;

  /// 用户名称
  @JsonKey(name: 'name')
  String? name;

  UserInfoResponseDto(this.id,this.code,this.name);

  factory UserInfoResponseDto.fromJson(Map<String, dynamic> srcJson) => _$UserInfoResponseDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserInfoResponseDtoToJson(this);
}

@JsonSerializable()
class User extends TBase {
  User();

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Pagination extends TBase {
  /// 页码
  @JsonKey(name: 'page')
  double? page;

  /// 每页数量
  @JsonKey(name: 'limit')
  double? limit;

  /// 排序字段
  @JsonKey(name: 'sortBy')
  String? sortBy;

  /// 排序方式
  @JsonKey(name: 'order')
  String? order;

  Pagination(this.page,this.limit,this.sortBy,this.order);

  factory Pagination.fromJson(Map<String, dynamic> srcJson) => _$PaginationFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class UserPageQueryDto extends TBase {
  /// 分页参数
  @JsonKey(name: 'pagination')
  dynamic pagination;

  /// 用户编码
  @JsonKey(name: 'code')
  String? code;

  /// 用户姓名
  @JsonKey(name: 'name')
  String? name;

  /// 用户邮箱
  @JsonKey(name: 'email')
  String? email;

  UserPageQueryDto(this.pagination,this.code,this.name,this.email);

  factory UserPageQueryDto.fromJson(Map<String, dynamic> srcJson) => _$UserPageQueryDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserPageQueryDtoToJson(this);
}

@JsonSerializable()
class SignInResponseDto extends TBase {
  /// 登录令牌
  @JsonKey(name: 'token')
  String? token;

  SignInResponseDto(this.token);

  factory SignInResponseDto.fromJson(Map<String, dynamic> srcJson) => _$SignInResponseDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$SignInResponseDtoToJson(this);
}

@JsonSerializable()
class SignInRequestDto extends TBase {
  /// 用户编号
  @JsonKey(name: 'code')
  String? code;

  /// 登录密码
  @JsonKey(name: 'password')
  String? password;

  /// 验证码绑定键
  @JsonKey(name: 'bindKey')
  String? bindKey;

  /// 验证码
  @JsonKey(name: 'captcha')
  String? captcha;

  SignInRequestDto(this.code,this.password,this.bindKey,this.captcha);

  factory SignInRequestDto.fromJson(Map<String, dynamic> srcJson) => _$SignInRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$SignInRequestDtoToJson(this);
}

@JsonSerializable()
class ImageCaptchaResponseDto extends TBase {
  /// 验证码绑定键
  @JsonKey(name: 'bindKey')
  String? bindKey;

  /// 验证码SVG图片
  @JsonKey(name: 'image')
  String? image;

  ImageCaptchaResponseDto(this.bindKey,this.image);

  factory ImageCaptchaResponseDto.fromJson(Map<String, dynamic> srcJson) => _$ImageCaptchaResponseDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ImageCaptchaResponseDtoToJson(this);
}
