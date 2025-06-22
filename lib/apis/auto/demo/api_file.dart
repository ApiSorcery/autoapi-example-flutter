import 'package:dio/dio.dart';
import 'base.dart';
import 'model.dart';

/// 文件管理
class ApiFile {
  /// 删除文件
  static Future deleteFile(DeleteFileRequest req) async {
    await createJsonRequest(
      url: '/file/${req.id}',
      method: 'DELETE',
    );
  }

  /// 获取文件
  static Future<String> getFile(GetFileRequest req) async {
    var response = await createJsonRequest(
      url: '/file/${req.id}',
      method: 'GET',
    );
    return response.data;
  }

  /// 上传文件
  static Future<String> uploadFile(UploadFileRequest req, {ProgressCallback? onSendProgress}) async {
    var response = await createUploadRequest(
      url: '/file/upload',
      method: 'POST',
      data: req.toFormData(),
      onSendProgress: onSendProgress,
    );
    return response.data;
  }

}