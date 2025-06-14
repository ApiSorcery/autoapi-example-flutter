// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveUserRequest _$RemoveUserRequestFromJson(Map<String, dynamic> json) =>
    RemoveUserRequest(
      (json['id'] as num).toDouble(),
    );

Map<String, dynamic> _$RemoveUserRequestToJson(RemoveUserRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
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

ValidateNickNameRequest _$ValidateNickNameRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateNickNameRequest(
      json['nickName'] as String,
    );

Map<String, dynamic> _$ValidateNickNameRequestToJson(
        ValidateNickNameRequest instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
    };

GetApplicationInfoRequest _$GetApplicationInfoRequestFromJson(
        Map<String, dynamic> json) =>
    GetApplicationInfoRequest(
      (json['id'] as num).toDouble(),
    );

Map<String, dynamic> _$GetApplicationInfoRequestToJson(
        GetApplicationInfoRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

RemoveApplicationRequest _$RemoveApplicationRequestFromJson(
        Map<String, dynamic> json) =>
    RemoveApplicationRequest(
      (json['id'] as num).toDouble(),
    );

Map<String, dynamic> _$RemoveApplicationRequestToJson(
        RemoveApplicationRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetServerInfoRequest _$GetServerInfoRequestFromJson(
        Map<String, dynamic> json) =>
    GetServerInfoRequest(
      (json['id'] as num).toDouble(),
    );

Map<String, dynamic> _$GetServerInfoRequestToJson(
        GetServerInfoRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

RemoveServerRequest _$RemoveServerRequestFromJson(Map<String, dynamic> json) =>
    RemoveServerRequest(
      (json['id'] as num).toDouble(),
    );

Map<String, dynamic> _$RemoveServerRequestToJson(
        RemoveServerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetApplicationPagedResponse _$GetApplicationPagedResponseFromJson(
        Map<String, dynamic> json) =>
    GetApplicationPagedResponse(
      (json['results'] as List<dynamic>?)
          ?.map(
              (e) => ApplicationResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetApplicationPagedResponseToJson(
        GetApplicationPagedResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'total': instance.total,
    };

GetServerPagedResponse _$GetServerPagedResponseFromJson(
        Map<String, dynamic> json) =>
    GetServerPagedResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ServerResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetServerPagedResponseToJson(
        GetServerPagedResponse instance) =>
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
      json['email'] as String?,
      json['nickName'] as String?,
      json['userName'] as String?,
    );

Map<String, dynamic> _$UserInfoResponseDtoToJson(
        UserInfoResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nickName': instance.nickName,
      'userName': instance.userName,
    };

User _$UserFromJson(Map<String, dynamic> json) => User();

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{};

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
      json['email'] as String?,
      json['password'] as String?,
      json['bindKey'] as String?,
      json['captcha'] as String?,
    );

Map<String, dynamic> _$SignInRequestDtoToJson(SignInRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'bindKey': instance.bindKey,
      'captcha': instance.captcha,
    };

SignUpRequestDto _$SignUpRequestDtoFromJson(Map<String, dynamic> json) =>
    SignUpRequestDto(
      json['email'] as String?,
      (json['captcha'] as num?)?.toDouble(),
      json['password'] as String?,
    );

Map<String, dynamic> _$SignUpRequestDtoToJson(SignUpRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'captcha': instance.captcha,
      'password': instance.password,
    };

ModifyPasswordRequestDto _$ModifyPasswordRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ModifyPasswordRequestDto(
      json['oldPassword'] as String?,
      json['newPassword'] as String?,
      json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$ModifyPasswordRequestDtoToJson(
        ModifyPasswordRequestDto instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
    };

SendEmailCaptchaRequestDto _$SendEmailCaptchaRequestDtoFromJson(
        Map<String, dynamic> json) =>
    SendEmailCaptchaRequestDto(
      json['email'] as String?,
    );

Map<String, dynamic> _$SendEmailCaptchaRequestDtoToJson(
        SendEmailCaptchaRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

FindPasswordRequestDto _$FindPasswordRequestDtoFromJson(
        Map<String, dynamic> json) =>
    FindPasswordRequestDto(
      json['email'] as String?,
      (json['captcha'] as num?)?.toDouble(),
      json['newPassword'] as String?,
    );

Map<String, dynamic> _$FindPasswordRequestDtoToJson(
        FindPasswordRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'captcha': instance.captcha,
      'newPassword': instance.newPassword,
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

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application();

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{};

ApplicationResponseDto _$ApplicationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ApplicationResponseDto(
      (json['id'] as num?)?.toDouble(),
      json['name'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ApplicationResponseDtoToJson(
        ApplicationResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

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

ApplicationQueryRequestDto _$ApplicationQueryRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ApplicationQueryRequestDto(
      json['name'] as String?,
      json['pagination'],
    );

Map<String, dynamic> _$ApplicationQueryRequestDtoToJson(
        ApplicationQueryRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pagination': instance.pagination,
    };

ApplicationAddRequestDto _$ApplicationAddRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ApplicationAddRequestDto(
      (json['productId'] as num?)?.toDouble(),
      json['name'] as String?,
    );

Map<String, dynamic> _$ApplicationAddRequestDtoToJson(
        ApplicationAddRequestDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
    };

ApplicationEditRequestDto _$ApplicationEditRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ApplicationEditRequestDto(
      (json['id'] as num?)?.toDouble(),
      json['name'] as String?,
    );

Map<String, dynamic> _$ApplicationEditRequestDtoToJson(
        ApplicationEditRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Server _$ServerFromJson(Map<String, dynamic> json) => Server();

Map<String, dynamic> _$ServerToJson(Server instance) => <String, dynamic>{};

ServerResponseDto _$ServerResponseDtoFromJson(Map<String, dynamic> json) =>
    ServerResponseDto(
      (json['id'] as num?)?.toDouble(),
      (json['applicationId'] as num?)?.toDouble(),
      (json['productId'] as num?)?.toDouble(),
      json['token'] as String?,
      json['code'] as String?,
      json['name'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ServerResponseDtoToJson(ServerResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'productId': instance.productId,
      'token': instance.token,
      'code': instance.code,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ServerQueryRequestDto _$ServerQueryRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ServerQueryRequestDto(
      (json['applicationId'] as num?)?.toDouble(),
      json['name'] as String?,
      json['pagination'],
    );

Map<String, dynamic> _$ServerQueryRequestDtoToJson(
        ServerQueryRequestDto instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'name': instance.name,
      'pagination': instance.pagination,
    };

ServerAddRequestDto _$ServerAddRequestDtoFromJson(Map<String, dynamic> json) =>
    ServerAddRequestDto(
      (json['productId'] as num?)?.toDouble(),
      (json['applicationId'] as num?)?.toDouble(),
      json['code'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ServerAddRequestDtoToJson(
        ServerAddRequestDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'applicationId': instance.applicationId,
      'code': instance.code,
      'name': instance.name,
    };

ServerEditRequestDto _$ServerEditRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ServerEditRequestDto(
      (json['id'] as num?)?.toDouble(),
      json['code'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ServerEditRequestDtoToJson(
        ServerEditRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

ReportResponseDto _$ReportResponseDtoFromJson(Map<String, dynamic> json) =>
    ReportResponseDto(
      json['results'] as List<dynamic>?,
    );

Map<String, dynamic> _$ReportResponseDtoToJson(ReportResponseDto instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ReportQueryRequestDto _$ReportQueryRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ReportQueryRequestDto(
      (json['applicationId'] as num?)?.toDouble(),
      (json['serverId'] as num?)?.toDouble(),
      json['startTime'] as String?,
      json['endTime'] as String?,
    );

Map<String, dynamic> _$ReportQueryRequestDtoToJson(
        ReportQueryRequestDto instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'serverId': instance.serverId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
