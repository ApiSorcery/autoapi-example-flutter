// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExportUsersRequest _$ExportUsersRequestFromJson(Map<String, dynamic> json) =>
    ExportUsersRequest(
      code: json['code'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ExportUsersRequestToJson(ExportUsersRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
    };

GetUserOneRequest _$GetUserOneRequestFromJson(Map<String, dynamic> json) =>
    GetUserOneRequest(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetUserOneRequestToJson(GetUserOneRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

RemoveUserRequest _$RemoveUserRequestFromJson(Map<String, dynamic> json) =>
    RemoveUserRequest(
      id: (json['id'] as num).toDouble(),
    );

Map<String, dynamic> _$RemoveUserRequestToJson(RemoveUserRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ValidateCodeRequest _$ValidateCodeRequestFromJson(Map<String, dynamic> json) =>
    ValidateCodeRequest(
      code: json['code'] as String,
    );

Map<String, dynamic> _$ValidateCodeRequestToJson(
        ValidateCodeRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
    };

ValidateEmailRequest _$ValidateEmailRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateEmailRequest(
      email: json['email'] as String,
    );

Map<String, dynamic> _$ValidateEmailRequestToJson(
        ValidateEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

DeleteFileRequest _$DeleteFileRequestFromJson(Map<String, dynamic> json) =>
    DeleteFileRequest(
      id: json['id'] as String,
    );

Map<String, dynamic> _$DeleteFileRequestToJson(DeleteFileRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetFileRequest _$GetFileRequestFromJson(Map<String, dynamic> json) =>
    GetFileRequest(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetFileRequestToJson(GetFileRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetUserPagedResponse _$GetUserPagedResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserPagedResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => UserInfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetUserPagedResponseToJson(
        GetUserPagedResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'total': instance.total,
    };

ResultData _$ResultDataFromJson(Map<String, dynamic> json) => ResultData(
      status: (json['status'] as num?)?.toDouble(),
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) => UserInfoDto(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      status: json['status'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
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

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      sortBy: json['sortBy'] as String?,
      order: json['order'] as String?,
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
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      code: json['code'] as String?,
      name: json['name'] as String?,
      status: json['status'] as bool?,
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
      code: json['code'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      status: json['status'] as bool?,
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
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      status: json['status'] as bool?,
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
