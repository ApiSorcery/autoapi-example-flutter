import 'dart:convert';

import 'package:autoapi_example_flutter/apis/auto/demo/api_file.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
import 'package:autoapi_example_flutter/utils/config.dart';
import 'package:autoapi_example_flutter/utils/constants.dart';
import 'package:autoapi_example_flutter/widgets/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:autoapi_example_flutter/utils/file.dart';
import 'package:flutter/foundation.dart';

class SingleImage extends StatefulWidget {
  final String? defaultImageUrl;
  final bool enabled;
  final Function? saveHandler;
  final double avatarWidth;
  final double avatarHeight;
  final Color preivewBgColor;
  const SingleImage(this.defaultImageUrl, this.enabled,
      {super.key,
      this.saveHandler,
      this.avatarWidth = 80,
      this.avatarHeight = 80,
      this.preivewBgColor = Colors.black});

  @override
  State<SingleImage> createState() => _SingleImageState();
}

class _SingleImageState extends State<SingleImage> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _imageUrl = widget.defaultImageUrl;
  }

  final imagePicker = ImagePicker();

  // 相机拍照
  Future _getCamera() async {
    Navigator.of(context).pop();
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      CompressFormat? format = FileUtil.getCompressFormat(pickedFile.path);
      if (format != null) {
        MultipartFile file;
        if (kIsWeb) {
          final bytes = await pickedFile.readAsBytes();
          file = MultipartFile.fromBytes(bytes, filename: pickedFile.name);
        } else {
          file = MultipartFile.fromFileSync(pickedFile.path,
              filename: pickedFile.name);
        }
        var req = UploadFileRequest(file: file);
        var imageId = await ApiFile.uploadFile(req);
        setState(() {
          _imageUrl = '${Config.apiHost}/file/$imageId';
          if (widget.saveHandler != null) {
            widget.saveHandler!(_imageUrl);
          }
        });
      } else {
        if (mounted) {
          toastWarning(context, "无效的图片格式!");
        }
      }
    }
  }

  // 选取图片，单选
  Future _getImage() async {
    Navigator.of(context).pop();
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      CompressFormat? format = FileUtil.getCompressFormat(pickedFile.name);
      if (format != null) {
        MultipartFile file;
        if (kIsWeb) {
          final bytes = await pickedFile.readAsBytes();
          file = MultipartFile.fromBytes(bytes, filename: pickedFile.name);
        } else {
          file = MultipartFile.fromFileSync(pickedFile.path,
              filename: pickedFile.name);
        }
        var req = UploadFileRequest(file: file);
        var imageId = await ApiFile.uploadFile(req);
        setState(() {
          _imageUrl = '${Config.apiHost}/file/$imageId';
          if (widget.saveHandler != null) {
            widget.saveHandler!(_imageUrl);
          }
        });
      } else {
        if (mounted) {
          toastWarning(context, "无效的图片格式!");
        }
      }
    }
  }

  Future _getActionSheet() async {
    // 点击时让当前焦点所在的文本框失焦，隐藏键盘
    FocusScope.of(context).requestFocus(FocusNode());
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                InkWell(
                    onTap: _getCamera,
                    child: ListTile(
                      leading: Icon(Icons.photo_camera),
                      title: Text("拍照"),
                    )),
                InkWell(
                    onTap: _getImage,
                    child: ListTile(
                      leading: Icon(Icons.photo),
                      title: Text("相册"),
                    )),
              ],
            ),
          );
        });
  }

  Widget _getImageWidget() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 12, 0),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.0, color: const Color.fromRGBO(204, 204, 204, 1)),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: GestureDetector(
              onTap: _getActionSheet,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: (_imageUrl ?? '').isEmpty
                      ? Image.memory(base64.decode(defaultImageBase64),
                          fit: BoxFit.fill,
                          width: widget.avatarWidth,
                          height: widget.avatarHeight)
                      : Image.network(_imageUrl!,
                          fit: BoxFit.fill,
                          width: widget.avatarWidth,
                          height: widget.avatarHeight)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
            runSpacing: 8,
            spacing: 8,
            alignment: WrapAlignment.start,
            children: [
              _getImageWidget(),
            ]));
  }
}
