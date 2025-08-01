import 'package:dio/dio.dart';
import 'base.dart';
import 'model.dart';

/// File
class ApiFile {
  /// Delete file
  static Future deleteFile(DeleteFileRequest req) async {
    await createJsonRequest(
      url: '/file/${req.id}',
      method: 'DELETE',
    );
  }

  /// Get file
  static Future<String> getFile(GetFileRequest req) async {
    var response = await createJsonRequest(
      url: '/file/${req.id}',
      method: 'GET',
    );
    return response.data;
  }

  /// Upload file
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