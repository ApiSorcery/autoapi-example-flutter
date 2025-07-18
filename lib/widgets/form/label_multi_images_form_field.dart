import 'package:flutter/material.dart';
import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:autoapi_example_flutter/widgets/photo/multi_images.dart';

class LabelMultiImagesFormField extends StatelessWidget {
  /// 标签
  final String? label;

  /// 值
  final List<String>? initialValue;

  /// 保存
  final Function? saveHandler;

  /// 是否可用,默认true
  final bool? enabled;

  /// 是否允许为空,默认true
  final bool allowEmpty;

  const LabelMultiImagesFormField({
    super.key,
    this.label,
    this.initialValue,
    this.saveHandler,
    this.enabled = true,
    this.allowEmpty = true,
  });

  @override
  Widget build(BuildContext context) {
    var imageEnabled = enabled ?? true;
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
              child: MultiImages(
                initialValue ?? <String>[],
                imageEnabled,
                saveHandler: saveHandler,
              ),
            )
          ],
        ));
  }
}
