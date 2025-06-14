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

/// 校验用户昵称是否存在请求参数
@JsonSerializable()
class ValidateNickNameRequest extends TBase {
  @JsonKey(name: 'nickName')
  String nickName;

  ValidateNickNameRequest(this.nickName);

  factory ValidateNickNameRequest.fromJson(Map<String, dynamic> srcJson) => _$ValidateNickNameRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ValidateNickNameRequestToJson(this);
}

/// 获取应用详情请求参数
@JsonSerializable()
class GetApplicationInfoRequest extends TBase {
  @JsonKey(name: 'id')
  double id;

  GetApplicationInfoRequest(this.id);

  factory GetApplicationInfoRequest.fromJson(Map<String, dynamic> srcJson) => _$GetApplicationInfoRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetApplicationInfoRequestToJson(this);
}

/// 删除应用请求参数
@JsonSerializable()
class RemoveApplicationRequest extends TBase {
  @JsonKey(name: 'id')
  double id;

  RemoveApplicationRequest(this.id);

  factory RemoveApplicationRequest.fromJson(Map<String, dynamic> srcJson) => _$RemoveApplicationRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$RemoveApplicationRequestToJson(this);
}

/// 获取服务详情请求参数
@JsonSerializable()
class GetServerInfoRequest extends TBase {
  @JsonKey(name: 'id')
  double id;

  GetServerInfoRequest(this.id);

  factory GetServerInfoRequest.fromJson(Map<String, dynamic> srcJson) => _$GetServerInfoRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetServerInfoRequestToJson(this);
}

/// 删除服务请求参数
@JsonSerializable()
class RemoveServerRequest extends TBase {
  @JsonKey(name: 'id')
  double id;

  RemoveServerRequest(this.id);

  factory RemoveServerRequest.fromJson(Map<String, dynamic> srcJson) => _$RemoveServerRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$RemoveServerRequestToJson(this);
}

/// 获取应用列表（分页）请求参数
@JsonSerializable()
class GetApplicationPagedResponse extends TBase {
  @JsonKey(name: 'results')
  List<ApplicationResponseDto>? results;

  @JsonKey(name: 'total')
  double? total;

  GetApplicationPagedResponse(this.results,this.total);

  factory GetApplicationPagedResponse.fromJson(Map<String, dynamic> srcJson) => _$GetApplicationPagedResponseFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetApplicationPagedResponseToJson(this);
}

/// 获取服务列表（分页）请求参数
@JsonSerializable()
class GetServerPagedResponse extends TBase {
  @JsonKey(name: 'results')
  List<ServerResponseDto>? results;

  @JsonKey(name: 'total')
  double? total;

  GetServerPagedResponse(this.results,this.total);

  factory GetServerPagedResponse.fromJson(Map<String, dynamic> srcJson) => _$GetServerPagedResponseFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetServerPagedResponseToJson(this);
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

  /// 用户邮箱
  @JsonKey(name: 'email')
  String? email;

  /// 用户昵称
  @JsonKey(name: 'nickName')
  String? nickName;

  /// 用户名称
  @JsonKey(name: 'userName')
  String? userName;

  UserInfoResponseDto(this.id,this.email,this.nickName,this.userName);

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
  /// 用户邮箱
  @JsonKey(name: 'email')
  String? email;

  /// 登录密码
  @JsonKey(name: 'password')
  String? password;

  /// 验证码绑定键
  @JsonKey(name: 'bindKey')
  String? bindKey;

  /// 验证码
  @JsonKey(name: 'captcha')
  String? captcha;

  SignInRequestDto(this.email,this.password,this.bindKey,this.captcha);

  factory SignInRequestDto.fromJson(Map<String, dynamic> srcJson) => _$SignInRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$SignInRequestDtoToJson(this);
}

@JsonSerializable()
class SignUpRequestDto extends TBase {
  /// 邮箱
  @JsonKey(name: 'email')
  String? email;

  /// 验证码
  @JsonKey(name: 'captcha')
  double? captcha;

  /// 密码
  @JsonKey(name: 'password')
  String? password;

  SignUpRequestDto(this.email,this.captcha,this.password);

  factory SignUpRequestDto.fromJson(Map<String, dynamic> srcJson) => _$SignUpRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$SignUpRequestDtoToJson(this);
}

@JsonSerializable()
class ModifyPasswordRequestDto extends TBase {
  /// 原始密码
  @JsonKey(name: 'oldPassword')
  String? oldPassword;

  /// 新密码
  @JsonKey(name: 'newPassword')
  String? newPassword;

  /// 确认密码
  @JsonKey(name: 'confirmPassword')
  String? confirmPassword;

  ModifyPasswordRequestDto(this.oldPassword,this.newPassword,this.confirmPassword);

  factory ModifyPasswordRequestDto.fromJson(Map<String, dynamic> srcJson) => _$ModifyPasswordRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ModifyPasswordRequestDtoToJson(this);
}

@JsonSerializable()
class SendEmailCaptchaRequestDto extends TBase {
  /// 邮箱
  @JsonKey(name: 'email')
  String? email;

  SendEmailCaptchaRequestDto(this.email);

  factory SendEmailCaptchaRequestDto.fromJson(Map<String, dynamic> srcJson) => _$SendEmailCaptchaRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$SendEmailCaptchaRequestDtoToJson(this);
}

@JsonSerializable()
class FindPasswordRequestDto extends TBase {
  /// 邮箱
  @JsonKey(name: 'email')
  String? email;

  /// 验证码
  @JsonKey(name: 'captcha')
  double? captcha;

  /// 新密码
  @JsonKey(name: 'newPassword')
  String? newPassword;

  FindPasswordRequestDto(this.email,this.captcha,this.newPassword);

  factory FindPasswordRequestDto.fromJson(Map<String, dynamic> srcJson) => _$FindPasswordRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$FindPasswordRequestDtoToJson(this);
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

@JsonSerializable()
class Application extends TBase {
  Application();

  factory Application.fromJson(Map<String, dynamic> srcJson) => _$ApplicationFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}

@JsonSerializable()
class ApplicationResponseDto extends TBase {
  /// 应用ID
  @JsonKey(name: 'id')
  double? id;

  /// 应用名称
  @JsonKey(name: 'name')
  String? name;

  /// 创建时间
  @JsonKey(name: 'createdAt')
  String? createdAt;

  /// 修改时间
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  ApplicationResponseDto(this.id,this.name,this.createdAt,this.updatedAt);

  factory ApplicationResponseDto.fromJson(Map<String, dynamic> srcJson) => _$ApplicationResponseDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ApplicationResponseDtoToJson(this);
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
class ApplicationQueryRequestDto extends TBase {
  /// 应用名称
  @JsonKey(name: 'name')
  String? name;

  /// 分页信息
  @JsonKey(name: 'pagination')
  dynamic pagination;

  ApplicationQueryRequestDto(this.name,this.pagination);

  factory ApplicationQueryRequestDto.fromJson(Map<String, dynamic> srcJson) => _$ApplicationQueryRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ApplicationQueryRequestDtoToJson(this);
}

@JsonSerializable()
class ApplicationAddRequestDto extends TBase {
  /// 产品ID
  @JsonKey(name: 'productId')
  double? productId;

  /// 应用名称
  @JsonKey(name: 'name')
  String? name;

  ApplicationAddRequestDto(this.productId,this.name);

  factory ApplicationAddRequestDto.fromJson(Map<String, dynamic> srcJson) => _$ApplicationAddRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ApplicationAddRequestDtoToJson(this);
}

@JsonSerializable()
class ApplicationEditRequestDto extends TBase {
  /// 应用ID
  @JsonKey(name: 'id')
  double? id;

  /// 应用名称
  @JsonKey(name: 'name')
  String? name;

  ApplicationEditRequestDto(this.id,this.name);

  factory ApplicationEditRequestDto.fromJson(Map<String, dynamic> srcJson) => _$ApplicationEditRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ApplicationEditRequestDtoToJson(this);
}

@JsonSerializable()
class Server extends TBase {
  Server();

  factory Server.fromJson(Map<String, dynamic> srcJson) => _$ServerFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ServerToJson(this);
}

@JsonSerializable()
class ServerResponseDto extends TBase {
  /// 服务ID
  @JsonKey(name: 'id')
  double? id;

  /// 应用ID
  @JsonKey(name: 'applicationId')
  double? applicationId;

  /// 产品ID
  @JsonKey(name: 'productId')
  double? productId;

  /// 服务令牌
  @JsonKey(name: 'token')
  String? token;

  /// 服务编号
  @JsonKey(name: 'code')
  String? code;

  /// 服务名称
  @JsonKey(name: 'name')
  String? name;

  /// 创建时间
  @JsonKey(name: 'createdAt')
  String? createdAt;

  /// 修改时间
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  ServerResponseDto(this.id,this.applicationId,this.productId,this.token,this.code,this.name,this.createdAt,this.updatedAt);

  factory ServerResponseDto.fromJson(Map<String, dynamic> srcJson) => _$ServerResponseDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ServerResponseDtoToJson(this);
}

@JsonSerializable()
class ServerQueryRequestDto extends TBase {
  /// 应用ID
  @JsonKey(name: 'applicationId')
  double? applicationId;

  /// 服务名称
  @JsonKey(name: 'name')
  String? name;

  /// 分页信息
  @JsonKey(name: 'pagination')
  dynamic pagination;

  ServerQueryRequestDto(this.applicationId,this.name,this.pagination);

  factory ServerQueryRequestDto.fromJson(Map<String, dynamic> srcJson) => _$ServerQueryRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ServerQueryRequestDtoToJson(this);
}

@JsonSerializable()
class ServerAddRequestDto extends TBase {
  /// 产品ID
  @JsonKey(name: 'productId')
  double? productId;

  /// 应用ID
  @JsonKey(name: 'applicationId')
  double? applicationId;

  /// 服务编号
  @JsonKey(name: 'code')
  String? code;

  /// 服务名称
  @JsonKey(name: 'name')
  String? name;

  ServerAddRequestDto(this.productId,this.applicationId,this.code,this.name);

  factory ServerAddRequestDto.fromJson(Map<String, dynamic> srcJson) => _$ServerAddRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ServerAddRequestDtoToJson(this);
}

@JsonSerializable()
class ServerEditRequestDto extends TBase {
  /// 服务ID
  @JsonKey(name: 'id')
  double? id;

  /// 服务编号
  @JsonKey(name: 'code')
  String? code;

  /// 服务名称
  @JsonKey(name: 'name')
  String? name;

  ServerEditRequestDto(this.id,this.code,this.name);

  factory ServerEditRequestDto.fromJson(Map<String, dynamic> srcJson) => _$ServerEditRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ServerEditRequestDtoToJson(this);
}

@JsonSerializable()
class ReportResponseDto extends TBase {
  /// 统计结果
  @JsonKey(name: 'results')
  List<dynamic>? results;

  ReportResponseDto(this.results);

  factory ReportResponseDto.fromJson(Map<String, dynamic> srcJson) => _$ReportResponseDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ReportResponseDtoToJson(this);
}

@JsonSerializable()
class ReportQueryRequestDto extends TBase {
  /// 应用ID
  @JsonKey(name: 'applicationId')
  double? applicationId;

  /// 服务ID
  @JsonKey(name: 'serverId')
  double? serverId;

  /// 开始时间
  @JsonKey(name: 'startTime')
  String? startTime;

  /// 结束时间
  @JsonKey(name: 'endTime')
  String? endTime;

  ReportQueryRequestDto(this.applicationId,this.serverId,this.startTime,this.endTime);

  factory ReportQueryRequestDto.fromJson(Map<String, dynamic> srcJson) => _$ReportQueryRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ReportQueryRequestDtoToJson(this);
}
