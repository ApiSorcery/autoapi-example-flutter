import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:typed_data';

part 'model.g.dart';

/// 报文基类
class TBase extends Object {
  Map<String, dynamic> toJson() => {};
}

/// FormData基类
class TFormData extends Object {
  FormData toFormData() => FormData.fromMap({});
}

/// 二进制数据返回类型
class BlobResp extends Object {
/// 文件类型
  String? type;

/// 文件名
  String? name;

/// 文件内容
  Uint8List? data;

  BlobResp({this.type, this.name, this.data});
}

/// 批量导出用户（Excel）请求参数
@JsonSerializable()
class ExportUsersRequest extends TBase {
  /// 用户编号
  @JsonKey(name: 'code')
  String? code;

  /// 用户名称
  @JsonKey(name: 'name')
  String? name;

  /// 邮箱
  @JsonKey(name: 'email')
  String? email;

  ExportUsersRequest({this.code,this.name,this.email});

  factory ExportUsersRequest.fromJson(Map<String, dynamic> srcJson) => _$ExportUsersRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ExportUsersRequestToJson(this);
}

/// 获取单个用户请求参数
@JsonSerializable()
class GetUserOneRequest extends TBase {
  @JsonKey(name: 'id')
  String id;

  GetUserOneRequest({required this.id});

  factory GetUserOneRequest.fromJson(Map<String, dynamic> srcJson) => _$GetUserOneRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetUserOneRequestToJson(this);
}

/// 删除用户请求参数
@JsonSerializable()
class RemoveUserRequest extends TBase {
  @JsonKey(name: 'id')
  double id;

  RemoveUserRequest({required this.id});

  factory RemoveUserRequest.fromJson(Map<String, dynamic> srcJson) => _$RemoveUserRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$RemoveUserRequestToJson(this);
}

/// 校验用户编号是否存在请求参数
@JsonSerializable()
class ValidateCodeRequest extends TBase {
  @JsonKey(name: 'code')
  String code;

  ValidateCodeRequest({required this.code});

  factory ValidateCodeRequest.fromJson(Map<String, dynamic> srcJson) => _$ValidateCodeRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ValidateCodeRequestToJson(this);
}

/// 校验用户邮箱是否存在请求参数
@JsonSerializable()
class ValidateEmailRequest extends TBase {
  @JsonKey(name: 'email')
  String email;

  ValidateEmailRequest({required this.email});

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

  DeleteFileRequest({required this.id});

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

  GetFileRequest({required this.id});

  factory GetFileRequest.fromJson(Map<String, dynamic> srcJson) => _$GetFileRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetFileRequestToJson(this);
}

/// 上传文件请求参数
class UploadFileRequest extends TFormData {
  /// 要上传的文件
  MultipartFile? file;

  /// 文件描述（可选）
  String? description;

  UploadFileRequest({this.file,this.description});

  @override
  FormData toFormData() {
    return FormData.fromMap({
      'file': file,
      'description': description,
    });
  }
}

/// 分页查询用户列表响应参数
@JsonSerializable()
class GetUserPagedResponse extends TBase {
  @JsonKey(name: 'results')
  List<UserInfoDto>? results;

  @JsonKey(name: 'total')
  double? total;

  GetUserPagedResponse({this.results,this.total});

  factory GetUserPagedResponse.fromJson(Map<String, dynamic> srcJson) => _$GetUserPagedResponseFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetUserPagedResponseToJson(this);
}

@JsonSerializable()
class ResultData extends TBase {
  /// 状态码
  @JsonKey(name: 'status')
  double? status;

  /// 状态描述
  @JsonKey(name: 'message')
  String? message;

  /// 返回结果
  @JsonKey(name: 'data')
  dynamic data;

  ResultData({this.status,this.message,this.data});

  factory ResultData.fromJson(Map<String, dynamic> srcJson) => _$ResultDataFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}

@JsonSerializable()
class UserInfoDto extends TBase {
  /// 用户ID
  @JsonKey(name: 'id')
  int? id;

  /// 用户编号
  @JsonKey(name: 'code')
  String? code;

  /// 用户名称
  @JsonKey(name: 'name')
  String? name;

  /// 邮箱
  @JsonKey(name: 'email')
  String? email;

  /// 性别
  @JsonKey(name: 'gender')
  int? gender;

  /// 头像
  @JsonKey(name: 'avatar')
  String? avatar;

  /// 地址
  @JsonKey(name: 'address')
  String? address;

  /// 状态
  @JsonKey(name: 'status')
  bool? status;

  /// 创建时间
  @JsonKey(name: 'createdAt')
  String? createdAt;

  /// 更新时间
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  UserInfoDto({this.id,this.code,this.name,this.email,this.gender,this.avatar,this.address,this.status,this.createdAt,this.updatedAt});

  factory UserInfoDto.fromJson(Map<String, dynamic> srcJson) => _$UserInfoDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);
}

@JsonSerializable()
class Pagination extends TBase {
  /// 页码
  @JsonKey(name: 'page')
  int? page;

  /// 每页数量
  @JsonKey(name: 'limit')
  int? limit;

  /// 排序字段
  @JsonKey(name: 'sortBy')
  String? sortBy;

  /// 排序方式
  @JsonKey(name: 'order')
  String? order;

  Pagination({this.page,this.limit,this.sortBy,this.order});

  factory Pagination.fromJson(Map<String, dynamic> srcJson) => _$PaginationFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class UserPageQueryDto extends TBase {
  /// 分页参数
  @JsonKey(name: 'pagination')
  Pagination? pagination;

  /// 用户编号
  @JsonKey(name: 'code')
  String? code;

  /// 用户姓名
  @JsonKey(name: 'name')
  String? name;

  /// 用户状态
  @JsonKey(name: 'status')
  bool? status;

  UserPageQueryDto({this.pagination,this.code,this.name,this.status});

  factory UserPageQueryDto.fromJson(Map<String, dynamic> srcJson) => _$UserPageQueryDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserPageQueryDtoToJson(this);
}

@JsonSerializable()
class UserAddRequestDto extends TBase {
  /// 用户编号
  @JsonKey(name: 'code')
  String? code;

  /// 用户名称
  @JsonKey(name: 'name')
  String? name;

  /// 邮箱
  @JsonKey(name: 'email')
  String? email;

  /// 性别
  @JsonKey(name: 'gender')
  int? gender;

  /// 头像
  @JsonKey(name: 'avatar')
  String? avatar;

  /// 地址
  @JsonKey(name: 'address')
  String? address;

  /// 状态
  @JsonKey(name: 'status')
  bool? status;

  UserAddRequestDto({this.code,this.name,this.email,this.gender,this.avatar,this.address,this.status});

  factory UserAddRequestDto.fromJson(Map<String, dynamic> srcJson) => _$UserAddRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserAddRequestDtoToJson(this);
}

@JsonSerializable()
class UserModifyRequestDto extends TBase {
  /// 用户ID
  @JsonKey(name: 'id')
  int? id;

  /// 用户编号
  @JsonKey(name: 'code')
  String? code;

  /// 用户名称
  @JsonKey(name: 'name')
  String? name;

  /// 邮箱
  @JsonKey(name: 'email')
  String? email;

  /// 性别
  @JsonKey(name: 'gender')
  int? gender;

  /// 头像
  @JsonKey(name: 'avatar')
  String? avatar;

  /// 地址
  @JsonKey(name: 'address')
  String? address;

  /// 状态
  @JsonKey(name: 'status')
  bool? status;

  UserModifyRequestDto({this.id,this.code,this.name,this.email,this.gender,this.avatar,this.address,this.status});

  factory UserModifyRequestDto.fromJson(Map<String, dynamic> srcJson) => _$UserModifyRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserModifyRequestDtoToJson(this);
}
