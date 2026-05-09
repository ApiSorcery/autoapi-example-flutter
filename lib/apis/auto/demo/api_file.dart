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
  static Future getFile(GetFileRequest req) async {
    await createJsonRequest(
      url: '/file/${req.id}',
      method: 'GET',
    );
  }

  /// Upload file
  static Future uploadFile(UploadFileRequest req, {ProgressCallback? onSendProgress}) async {
    await createUploadRequest(
      url: '/file/upload',
      method: 'POST',
      data: req.toFormData(),
      onSendProgress: onSendProgress,
    );
  }

}