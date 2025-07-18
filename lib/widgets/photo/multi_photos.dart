import 'package:autoapi_example_flutter/apis/auto/demo/api_file.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
import 'package:autoapi_example_flutter/widgets/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:autoapi_example_flutter/utils/router.dart';
import 'package:autoapi_example_flutter/utils/file.dart';
import 'package:flutter/foundation.dart';

class IconTextButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final GestureTapCallback? onTap;

  const IconTextButton({super.key, this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon ?? Icons.device_unknown),
        title: Text(text ?? ""),
      ),
    );
  }
}

class MultiPhotos extends StatefulWidget {
  final List<String> imageUrls;
  final bool enabled;
  final Function? validator;
  final Function? saveHandler;
  final String? uploadUrl;
  final double avatarWidth;
  final double avatarHeight;
  final Color preivewBgColor;
  const MultiPhotos(this.imageUrls, this.enabled,
      {super.key,
      this.validator,
      this.saveHandler,
      this.uploadUrl,
      this.avatarWidth = 80,
      this.avatarHeight = 80,
      this.preivewBgColor = Colors.black});

  @override
  State<MultiPhotos> createState() => _MultiPhotosState();
}

class _MultiPhotosState extends State<MultiPhotos> {
  List<AssetEntity> picked = [];
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
          file = MultipartFile.fromFileSync(pickedFile.path, filename: pickedFile.name);
        }
        var req = UploadFileRequest(file: file);
        var imageUrl = await ApiFile.uploadFile(req);
        setState(() {
          widget.imageUrls.add(imageUrl);
          if (widget.saveHandler != null) {
            widget.saveHandler!(widget.imageUrls);
          }
        });
      } else {
        if (mounted) {
          toastWarning(context, "无效的图片格式!");
        }
      }
    }
  }

  // 选取图片，多选
  Future _getImages() async {
    Navigator.of(context).pop();
    final List<XFile> pickedFiles = await imagePicker.pickMultiImage(limit: 5);
    List<String> selectedImageUrls = [];
    List<String> invalidImageUrls = [];
    if (pickedFiles.isNotEmpty) {
      for (var pickedFile in pickedFiles) {
        if (widget.uploadUrl != null) {
          CompressFormat? format = FileUtil.getCompressFormat(pickedFile.name);
          if (format != null) {
            MultipartFile file;
            if (kIsWeb) {
              final bytes = await pickedFile.readAsBytes();
              file = MultipartFile.fromBytes(bytes, filename: pickedFile.name);
            } else {
              file = MultipartFile.fromFileSync(pickedFile.path, filename: pickedFile.name);
            }
            var req = UploadFileRequest(file: file);
            var imageId = await ApiFile.uploadFile(req);
            selectedImageUrls.add('/file/$imageId');
          } else {
            invalidImageUrls.add(pickedFile.path);
          }
        }
      }
    }

    if (invalidImageUrls.isNotEmpty) {
      if (mounted) {
        toastWarning(context, "${invalidImageUrls.length}张图片格式不支持,已跳过");
      }
    }

    setState(() {
      widget.imageUrls.addAll(selectedImageUrls);
      if (widget.saveHandler != null) {
        widget.saveHandler!(widget.imageUrls);
      }
    });
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
                IconTextButton(
                  icon: Icons.photo_camera,
                  text: "拍照",
                  onTap: _getCamera,
                ),
                IconTextButton(
                  icon: Icons.photo,
                  text: "相册",
                  onTap: _getImages,
                ),
              ],
            ),
          );
        });
  }

  Widget getPhoto() {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: GestureDetector(
          child: Container(
            width: widget.avatarWidth,
            height: widget.avatarHeight,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0, color: const Color.fromRGBO(204, 204, 204, 1)),
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: Icon(
              Icons.camera_alt,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onTap: () => _getActionSheet(),
        ));
  }

  List<Widget> _getImageList() {
    List<Widget> imgs = [];
    for (int i = 0; i < widget.imageUrls.length; i++) {
      var imageWidget = Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 12, 0),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: const Color.fromRGBO(204, 204, 204, 1)),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: GestureDetector(
                onTap: () {
                  // 点击图片时让当前焦点所在的文本框失焦，隐藏键盘
                  FocusScope.of(context).requestFocus(FocusNode());
                  Routes.push(context, Routes.imgView, {
                    'photoList': widget.imageUrls,
                    'index': i,
                    'preivewBgColor': widget.preivewBgColor
                  });
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                        FileUtil.getFileMappedFullName(widget.imageUrls[i]),
                        fit: BoxFit.fill,
                        width: widget.avatarWidth,
                        height: widget.avatarHeight)))),
      );
      var deleteWidget = GestureDetector(
        child: ClipOval(
          child: Container(
            width: 24.0,
            height: 24.0,
            color: Colors.red[400],
            child: const Icon(Icons.close, color: Colors.white, size: 12.0),
          ),
        ),
        onTap: () {
          // 点击图片时让当前焦点所在的文本框失焦，隐藏键盘
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            widget.imageUrls.remove(widget.imageUrls[i]);
            if (widget.saveHandler != null) {
              widget.saveHandler!(widget.imageUrls);
            }
          });
        },
      );
      if (widget.enabled) {
        imgs.add(Stack(
            alignment: Alignment.topRight,
            children: <Widget>[imageWidget, deleteWidget]));
      } else {
        imgs.add(imageWidget);
      }
    }

    if (widget.enabled) {
      imgs.add(getPhoto());
    }
    return imgs;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
            runSpacing: 8,
            spacing: 8,
            alignment: WrapAlignment.start,
            children: _getImageList()));
  }
}
