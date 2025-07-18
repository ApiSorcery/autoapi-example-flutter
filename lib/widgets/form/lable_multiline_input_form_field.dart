import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autoapi_example_flutter/utils/style.dart';

class LableMultilineInputFormField extends StatelessWidget {
  /// 标签
  final String label;

  /// 值
  final String? initialValue;

  /// 校验
  final Function? validator;

  /// 保存
  final Function? saveHandler;

  /// 显示行数
  final int maxLines;

  final String trailingText;

  /// 是否可用,默认true
  final bool enabled;

  /// 是否允许为空,默认true
  final bool allowEmpty;

  const LableMultilineInputFormField(
      {super.key,
      required this.label,
      required this.saveHandler,
      this.initialValue,
      this.validator,
      this.trailingText = '',
      this.maxLines = 3,
      this.enabled = true,
      this.allowEmpty = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    allowEmpty
                        ? Container()
                        : const Padding(
                            padding: EdgeInsets.only(top: 5, right: 2),
                            child: Text('*',
                                style: AppTextStyle.formLabelRequired),
                          ),
                    Text(label, style: AppTextStyle.formLabel)
                  ])),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextFormField(
                autocorrect: false,
                style: AppTextStyle.formText,
                maxLines: maxLines,
                decoration: InputDecoration(
                    hintText: enabled ? '请输入' : '暂无数据',
                    hintStyle: AppTextStyle.formLightGrayText,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(230, 230, 230, 1)))),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                      "[\\a-\\z\\A-\\Z0-9\\u4E00-\\u9FA5\\.\\,\\?\\<\\>\\。\\，\\-\\——\\=\\;\\！\\!\\+]")), //只能输入汉字或者字母或数字
                  LengthLimitingTextInputFormatter(50), //最大长度
                ],
                initialValue: initialValue,
                validator: validator as FormFieldValidator<String>?,
                onSaved:  (value) {
                  if (saveHandler != null) {
                    saveHandler!(value);
                  }
                },
                enabled: enabled,
              )),
          trailingText.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text(trailingText, style: AppTextStyle.formLabel))),
        ],
      ),
    );
  }
}
