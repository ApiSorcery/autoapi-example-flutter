import 'dart:typed_data';

/// Binary data response type
class BlobResp extends Object {
/// File type
  String? type;

/// File name
  String? name;

/// File content
  Uint8List? data;

  BlobResp({this.type, this.name, this.data});
}