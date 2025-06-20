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

  /// 生成验证码
  static Future<ImageCaptchaResponseDto> generateCaptcha() async {
    var response = await createNoParamsJsonRequest(
      url: '/auth/captcha',
      method: 'GET'
    );
    return ImageCaptchaResponseDto.fromJson(response.data);
  }

}