import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:autoapi_example_flutter/widgets/formFields/text_form_field_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelInputFormField extends StatelessWidget {
  /// 标签
  final String? label;

  /// 值
  final String? initialValue;

  /// 校验
  final Function? validator;

  /// 保存
  final Function? saveHandler;

  /// 是否可用,默认true
  final bool enabled;

  /// 是否自动获取焦点,默认false
  final bool autoFocus;

  /// 是否允许为空,默认true
  final bool allowEmpty;

  const LabelInputFormField(
      {super.key,
      this.label,
      this.initialValue,
      this.validator,
      this.saveHandler,
      this.enabled = true,
      this.autoFocus = false,
      this.allowEmpty = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              allowEmpty
                  ? Container()
                  : const Padding(
                      padding: EdgeInsets.only(top: 5, right: 2),
                      child: Text('*', style: AppTextStyle.formLabelRequired),
                    ),
              Text(
                label ?? '',
                style: AppTextStyle.formLabel,
                textAlign: TextAlign.left,
              ),
              Expanded(
                  child: TextFormFieldV2(
                textAlign: TextAlign.right,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: enabled ? '请输入' : '暂无',
                  hintStyle: AppTextStyle.formLightGrayText,
                  disabledBorder: InputBorder.none,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black38, width: 1.5)),
                  focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.5)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                      "[\\a-\\z\\A-\\Z0-9\\u4E00-\\u9FA5\\.\\,\\?\\<\\>\\。\\，\\-\\——\\=\\;\\！\\!\\+]")), //只能输入汉字或者字母或数字
                  LengthLimitingTextInputFormatter(50), //最大长度
                ],
                initialValue: initialValue ?? '',
                // controller: controller,
                style: AppTextStyle.formText,
                validator: validator as FormFieldValidator<String>?,
                onSaved: (value) {
                  if (saveHandler != null) {
                    saveHandler!(value);
                  }
                },
                onChanged: (value) {
                  if (saveHandler != null) {
                    saveHandler!(value);
                  }
                },
                enabled: enabled,
                autofocus: autoFocus,
              ))
            ]));
  }
}
