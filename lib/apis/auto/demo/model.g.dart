// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExportUsersRequest _$ExportUsersRequestFromJson(Map<String, dynamic> json) =>
    ExportUsersRequest(
      json['code'] as String,
      json['name'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$ExportUsersRequestToJson(ExportUsersRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
    };

GetUserOneRequest _$GetUserOneRequestFromJson(Map<String, dynamic> json) =>
    GetUserOneRequest(
      json['id'] as String,
    );

Map<String, dynamic> _$GetUserOneRequestToJson(GetUserOneRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

RemoveUserRequest _$RemoveUserRequestFromJson(Map<String, dynamic> json) =>
    RemoveUserRequest(
      (json['id'] as num).toDouble(),
    );

Map<String, dynamic> _$RemoveUserRequestToJson(RemoveUserRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ValidateCodeRequest _$ValidateCodeRequestFromJson(Map<String, dynamic> json) =>
    ValidateCodeRequest(
      json['code'] as String,
    );

Map<String, dynamic> _$ValidateCodeRequestToJson(
        ValidateCodeRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
    };

ValidateEmailRequest _$ValidateEmailRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateEmailRequest(
      json['email'] as String,
    );

Map<String, dynamic> _$ValidateEmailRequestToJson(
        ValidateEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

DeleteFileRequest _$DeleteFileRequestFromJson(Map<String, dynamic> json) =>
    DeleteFileRequest(
      json['id'] as String,
    );

Map<String, dynamic> _$DeleteFileRequestToJson(DeleteFileRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetFileRequest _$GetFileRequestFromJson(Map<String, dynamic> json) =>
    GetFileRequest(
      json['id'] as String,
    );

Map<String, dynamic> _$GetFileRequestToJson(GetFileRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetUserPagedResponse _$GetUserPagedResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserPagedResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => UserInfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetUserPagedResponseToJson(
        GetUserPagedResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'total': instance.total,
    };

ResultData _$ResultDataFromJson(Map<String, dynamic> json) => ResultData(
      (json['status'] as num?)?.toDouble(),
      json['message'] as String?,
      json['data'],
    );

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) => UserInfoDto(
      (json['id'] as num?)?.toDouble(),
      json['code'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      (json['gender'] as num?)?.toDouble(),
      json['avatar'] as String?,
      json['address'] as String?,
      json['status'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserInfoDtoToJson(UserInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'address': instance.address,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

User _$UserFromJson(Map<String, dynamic> json) => User();

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      (json['page'] as num?)?.toDouble(),
      (json['limit'] as num?)?.toDouble(),
      json['sortBy'] as String?,
      json['order'] as String?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'sortBy': instance.sortBy,
      'order': instance.order,
    };

UserPageQueryDto _$UserPageQueryDtoFromJson(Map<String, dynamic> json) =>
    UserPageQueryDto(
      json['pagination'],
      json['code'] as String?,
      json['name'] as String?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$UserPageQueryDtoToJson(UserPageQueryDto instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'code': instance.code,
      'name': instance.name,
      'status': instance.status,
    };

UserAddRequestDto _$UserAddRequestDtoFromJson(Map<String, dynamic> json) =>
    UserAddRequestDto(
      json['code'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      (json['gender'] as num?)?.toDouble(),
      json['avatar'] as String?,
      json['address'] as String?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$UserAddRequestDtoToJson(UserAddRequestDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'address': instance.address,
      'status': instance.status,
    };

UserModifyRequestDto _$UserModifyRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UserModifyRequestDto(
      (json['id'] as num?)?.toDouble(),
      json['code'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      (json['gender'] as num?)?.toDouble(),
      json['avatar'] as String?,
      json['address'] as String?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$UserModifyRequestDtoToJson(
        UserModifyRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'address': instance.address,
      'status': instance.status,
    };
