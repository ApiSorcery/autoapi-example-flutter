import 'base.dart';
import 'model.dart';

/// 用户认证
class ApiAuth {
  /// 用户登录
  static Future<SignInResponseDto> authSignIn(SignInRequestDto req) async {
    var response = await createJsonRequest(
      url: '/auth/signIn',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return SignInResponseDto.fromJson(response.data);
  }

  /// 新增用户
  static Future<double> authSignUp(SignUpRequestDto req) async {
    var response = await createJsonRequest(
      url: '/auth/signUp',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
    return response.data;
  }

  /// 找回密码
  static Future findPassword(FindPasswordRequestDto req) async {
    await createJsonRequest(
      url: '/auth/findPassword',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
  }

  /// 生成验证码
  static Future<ImageCaptchaResponseDto> generateCaptcha() async {
    var response = await createNoParamsJsonRequest(
      url: '/auth/captcha',
      method: 'GET'
    );
    return ImageCaptchaResponseDto.fromJson(response.data);
  }

  /// 修改密码
  static Future modifyPassword(ModifyPasswordRequestDto req) async {
    await createJsonRequest(
      url: '/auth/modifyPassword',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
  }

  /// 发送邮箱验证码
  static Future sendEmailCaptcha(SendEmailCaptchaRequestDto req) async {
    await createJsonRequest(
      url: '/auth/sendEmailCaptcha',
      method: 'POST',
      contentType: 'application/json',
      data: req.toJson()
    );
  }

}