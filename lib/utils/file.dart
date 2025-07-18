import 'package:flutter_image_compress/flutter_image_compress.dart';

class FileUtil {
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
