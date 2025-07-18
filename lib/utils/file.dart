import 'package:autoapi_example_flutter/utils/config.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class FileUtil {
  /// 获取文件映射后的全路径(后端API路径转前端站点路径)
  /// - [initialFullName] 初始全路径
  /// - return 映射后的全路径
  static String getFileMappedFullName(String initialFullName) {
    var finalUrl = initialFullName;
    if (finalUrl.contains('//')) {
      finalUrl = finalUrl.substring(finalUrl.indexOf('//') + 2);
      finalUrl = finalUrl.substring(finalUrl.indexOf('/') + 1);
    }

    finalUrl = '${Config.apiHost}$finalUrl';
    return finalUrl;
  }

  static CompressFormat? getCompressFormat(String filePath) {
    var name =
        filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
    if (name.endsWith('.jpg') || name.endsWith('.jpeg')) {
      return CompressFormat.jpeg;
    } else if (name.endsWith('.png')) {
      return CompressFormat.png;
    } else if (name.endsWith('.heic')) {
      return CompressFormat.heic;
    } else if (name.endsWith('.webp')) {
      return CompressFormat.webp;
    } else {
      return null;
    }
  }
}
