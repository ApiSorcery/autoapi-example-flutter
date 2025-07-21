import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:autoapi_example_flutter/widgets/photo/single_image.dart';

class LabelSingleImageFormField extends StatelessWidget {
  /// 标签
  final String? label;

  /// 值
  final String? initialValue;

  /// 上传
  final Future<String?> Function(MultipartFile file)? uploadHandler;

  /// 保存
  final Function? saveHandler;

  /// 是否可用,默认true
  final bool enabled;

  /// 是否允许为空,默认true
  final bool allowEmpty;

  final double avatarWidth;

  final double avatarHeight;

  const LabelSingleImageFormField({
    super.key,
    this.label,
    this.initialValue,
    this.uploadHandler,
    this.saveHandler,
    this.enabled = true,
    this.allowEmpty = true,
    this.avatarWidth = 80,
    this.avatarHeight = 80,
  });

  @override
  Widget build(BuildContext context) {
    var imageEnabled = enabled;
    var showLabel = label != null && label!.isNotEmpty;
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
        child: Column(
          children: <Widget>[
            showLabel
                ? Row(
                    children: <Widget>[
                      allowEmpty
                          ? Container()
                          : const Padding(
                              padding: EdgeInsets.only(top: 5, right: 2),
                              child: Text('*',
                                  style: AppTextStyle.formLabelRequired),
                            ),
                      Text(
                        label ?? '暂无',
                        style: AppTextStyle.formLabel,
                      ),
                    ],
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SingleImage(
                initialValue,
                imageEnabled,
                uploadHandler: uploadHandler,
                saveHandler: saveHandler,
                avatarWidth: avatarWidth,
                avatarHeight: avatarHeight,
              ),
            )
          ],
        ));
  }
}
