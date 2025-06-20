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
      (json['id'] as num).toDouble(),
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

GetUserPageResponse _$GetUserPageResponseFromJson(Map<String, dynamic> json) =>
    GetUserPageResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetUserPageResponseToJson(
        GetUserPageResponse instance) =>
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

UserInfoResponseDto _$UserInfoResponseDtoFromJson(Map<String, dynamic> json) =>
    UserInfoResponseDto(
      (json['id'] as num?)?.toDouble(),
      json['code'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$UserInfoResponseDtoToJson(
        UserInfoResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
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
      json['email'] as String?,
    );

Map<String, dynamic> _$UserPageQueryDtoToJson(UserPageQueryDto instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
    };

SignInResponseDto _$SignInResponseDtoFromJson(Map<String, dynamic> json) =>
    SignInResponseDto(
      json['token'] as String?,
    );

Map<String, dynamic> _$SignInResponseDtoToJson(SignInResponseDto instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

SignInRequestDto _$SignInRequestDtoFromJson(Map<String, dynamic> json) =>
    SignInRequestDto(
      json['code'] as String?,
      json['password'] as String?,
      json['bindKey'] as String?,
      json['captcha'] as String?,
    );

Map<String, dynamic> _$SignInRequestDtoToJson(SignInRequestDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'password': instance.password,
      'bindKey': instance.bindKey,
      'captcha': instance.captcha,
    };

ImageCaptchaResponseDto _$ImageCaptchaResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ImageCaptchaResponseDto(
      json['bindKey'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$ImageCaptchaResponseDtoToJson(
        ImageCaptchaResponseDto instance) =>
    <String, dynamic>{
      'bindKey': instance.bindKey,
      'image': instance.image,
    };
