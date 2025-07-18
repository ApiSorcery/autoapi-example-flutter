import 'package:flutter/material.dart';
import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:autoapi_example_flutter/widgets/formFields/select_form_field.dart';

class LabelSelectFormField extends StatelessWidget {
  /// 标签
  final String label;

  /// 值
  final dynamic initialValue;

  /// 数据源
  final Map<dynamic, String> options;

  /// 校验
  final Function? validator;

  /// 保存
  final Function saveHandler;

  /// 是否可用,默认true
  final bool enabled;

  const LabelSelectFormField(
      {super.key,
      required this.label,
      required this.initialValue,
      required this.options,
      required this.saveHandler,
      this.validator,
      this.enabled = true});

  Widget _getUnabledWidget() {
    var currentText = initialValue ?? '';
    if (options.isNotEmpty &&
        initialValue != null &&
        options.containsKey(initialValue)) {
      currentText = options[initialValue];
    }
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(currentText,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1),
              fontSize: 14,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text(label, style: AppTextStyle.formLabel)),
              Expanded(
                  child: enabled
                      ? SelectFormField(
                          isExpanded: true,
                          hint: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                enabled ? '请选择' : '',
                                style: AppTextStyle.formLightGrayText,
                              )),
                          decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          value: (options.isNotEmpty)
                              ? (initialValue == '' ? null : initialValue)
                              : null,
                          onSaved: (value) {
                            saveHandler(value);
                          },
                          onChanged: (value) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            saveHandler(value);
                          },
                          validator: validator as FormFieldValidator<dynamic>?,
                          autovalidateMode: AutovalidateMode.always,
                          items: (options.isNotEmpty)
                              ? options.keys.map((optionKey) {
                                  return DropdownMenuItem(
                                      value: optionKey,
                                      child: Center(
                                        child: Text(options[optionKey]!,
                                            style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(51, 51, 51, 1),
                                              fontSize: 14,
                                            )),
                                      ));
                                }).toList()
                              : <DropdownMenuItem>[],
                        )
                      : _getUnabledWidget())
            ]));
  }
}
