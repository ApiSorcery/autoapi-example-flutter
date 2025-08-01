import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:typed_data';

part 'model.g.dart';

/// Base class for messages
class TBase extends Object {
  Map<String, dynamic> toJson() => {};
}

/// Base class for FormData
class TFormData extends Object {
  FormData toFormData() => FormData.fromMap({});
}

/// Binary data response type
class BlobResp extends Object {
/// File type
  String? type;

/// File name
  String? name;

/// File content
  Uint8List? data;

  BlobResp({this.type, this.name, this.data});
}

/// Batch export users (Excel) request parameters
@JsonSerializable()
class ExportUsersRequest extends TBase {
  /// User code
  @JsonKey(name: 'code')
  String? code;

  /// User name
  @JsonKey(name: 'name')
  String? name;

  /// Email address
  @JsonKey(name: 'email')
  String? email;

  ExportUsersRequest({this.code,this.name,this.email});

  factory ExportUsersRequest.fromJson(Map<String, dynamic> srcJson) => _$ExportUsersRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ExportUsersRequestToJson(this);
}

/// Get single user request parameters
@JsonSerializable()
class GetUserOneRequest extends TBase {
  /// User ID
  @JsonKey(name: 'id')
  int id;

  GetUserOneRequest({required this.id});

  factory GetUserOneRequest.fromJson(Map<String, dynamic> srcJson) => _$GetUserOneRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetUserOneRequestToJson(this);
}

/// Delete user request parameters
@JsonSerializable()
class RemoveUserRequest extends TBase {
  /// User ID
  @JsonKey(name: 'id')
  int id;

  RemoveUserRequest({required this.id});

  factory RemoveUserRequest.fromJson(Map<String, dynamic> srcJson) => _$RemoveUserRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$RemoveUserRequestToJson(this);
}

/// Validate if user code exists request parameters
@JsonSerializable()
class ValidateCodeRequest extends TBase {
  /// User code
  @JsonKey(name: 'code')
  String code;

  ValidateCodeRequest({required this.code});

  factory ValidateCodeRequest.fromJson(Map<String, dynamic> srcJson) => _$ValidateCodeRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ValidateCodeRequestToJson(this);
}

/// Validate if user email exists request parameters
@JsonSerializable()
class ValidateEmailRequest extends TBase {
  /// Email address
  @JsonKey(name: 'email')
  String email;

  ValidateEmailRequest({required this.email});

  factory ValidateEmailRequest.fromJson(Map<String, dynamic> srcJson) => _$ValidateEmailRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ValidateEmailRequestToJson(this);
}

/// Delete file request parameters
@JsonSerializable()
class DeleteFileRequest extends TBase {
  /// File UUID
  @JsonKey(name: 'id')
  String id;

  DeleteFileRequest({required this.id});

  factory DeleteFileRequest.fromJson(Map<String, dynamic> srcJson) => _$DeleteFileRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$DeleteFileRequestToJson(this);
}

/// Get file request parameters
@JsonSerializable()
class GetFileRequest extends TBase {
  /// File UUID
  @JsonKey(name: 'id')
  String id;

  GetFileRequest({required this.id});

  factory GetFileRequest.fromJson(Map<String, dynamic> srcJson) => _$GetFileRequestFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$GetFileRequestToJson(this);
}

/// Upload file request parameters
class UploadFileRequest extends TFormData {
  /// File to upload
  MultipartFile? file;

  /// File description (optional)
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

/// Query user list with pagination response parameters
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
  /// Status code
  @JsonKey(name: 'status')
  double? status;

  /// Status description
  @JsonKey(name: 'message')
  String? message;

  /// Response data
  @JsonKey(name: 'data')
  dynamic data;

  ResultData({this.status,this.message,this.data});

  factory ResultData.fromJson(Map<String, dynamic> srcJson) => _$ResultDataFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}

@JsonSerializable()
class UserInfoDto extends TBase {
  /// User ID
  @JsonKey(name: 'id')
  int? id;

  /// User code
  @JsonKey(name: 'code')
  String? code;

  /// User name
  @JsonKey(name: 'name')
  String? name;

  /// Email
  @JsonKey(name: 'email')
  String? email;

  /// Gender
  @JsonKey(name: 'gender')
  int? gender;

  /// Avatar
  @JsonKey(name: 'avatar')
  String? avatar;

  /// Address
  @JsonKey(name: 'address')
  String? address;

  /// Status
  @JsonKey(name: 'status')
  bool? status;

  /// Created time
  @JsonKey(name: 'createdAt')
  String? createdAt;

  /// Updated time
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  UserInfoDto({this.id,this.code,this.name,this.email,this.gender,this.avatar,this.address,this.status,this.createdAt,this.updatedAt});

  factory UserInfoDto.fromJson(Map<String, dynamic> srcJson) => _$UserInfoDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);
}

@JsonSerializable()
class Pagination extends TBase {
  /// Page number
  @JsonKey(name: 'page')
  int? page;

  /// Items per page
  @JsonKey(name: 'limit')
  int? limit;

  /// Sort field
  @JsonKey(name: 'sortBy')
  String? sortBy;

  /// Sort order
  @JsonKey(name: 'order')
  String? order;

  Pagination({this.page,this.limit,this.sortBy,this.order});

  factory Pagination.fromJson(Map<String, dynamic> srcJson) => _$PaginationFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class UserPageQueryDto extends TBase {
  /// Pagination parameters
  @JsonKey(name: 'pagination')
  Pagination? pagination;

  /// User code
  @JsonKey(name: 'code')
  String? code;

  /// User name
  @JsonKey(name: 'name')
  String? name;

  /// User status
  @JsonKey(name: 'status')
  bool? status;

  UserPageQueryDto({this.pagination,this.code,this.name,this.status});

  factory UserPageQueryDto.fromJson(Map<String, dynamic> srcJson) => _$UserPageQueryDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserPageQueryDtoToJson(this);
}

@JsonSerializable()
class UserAddRequestDto extends TBase {
  /// User code
  @JsonKey(name: 'code')
  String? code;

  /// User name
  @JsonKey(name: 'name')
  String? name;

  /// Email
  @JsonKey(name: 'email')
  String? email;

  /// Gender
  @JsonKey(name: 'gender')
  int? gender;

  /// Avatar
  @JsonKey(name: 'avatar')
  String? avatar;

  /// Address
  @JsonKey(name: 'address')
  String? address;

  /// Status
  @JsonKey(name: 'status')
  bool? status;

  UserAddRequestDto({this.code,this.name,this.email,this.gender,this.avatar,this.address,this.status});

  factory UserAddRequestDto.fromJson(Map<String, dynamic> srcJson) => _$UserAddRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserAddRequestDtoToJson(this);
}

@JsonSerializable()
class UserModifyRequestDto extends TBase {
  /// User ID
  @JsonKey(name: 'id')
  int? id;

  /// User code
  @JsonKey(name: 'code')
  String? code;

  /// User name
  @JsonKey(name: 'name')
  String? name;

  /// Email
  @JsonKey(name: 'email')
  String? email;

  /// Gender
  @JsonKey(name: 'gender')
  int? gender;

  /// Avatar
  @JsonKey(name: 'avatar')
  String? avatar;

  /// Address
  @JsonKey(name: 'address')
  String? address;

  /// Status
  @JsonKey(name: 'status')
  bool? status;

  UserModifyRequestDto({this.id,this.code,this.name,this.email,this.gender,this.avatar,this.address,this.status});

  factory UserModifyRequestDto.fromJson(Map<String, dynamic> srcJson) => _$UserModifyRequestDtoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$UserModifyRequestDtoToJson(this);
}
