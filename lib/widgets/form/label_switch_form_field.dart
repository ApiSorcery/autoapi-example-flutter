import 'package:autoapi_example_flutter/entities/tuple_entity.dart';
import 'package:flutter/material.dart';
import 'package:autoapi_example_flutter/utils/style.dart';

class LabelSwitchFormField extends StatelessWidget {
  /// 标签
  final String? label;

  /// 值
  final TupleEntity<bool, String>? initialValue;

  /// 校验
  final Function? validator;

  /// 保存
  final Function? saveHandler;

  /// 是否可用,默认true
  final bool enabled;

  const LabelSwitchFormField(
      {super.key,
      this.label,
      this.initialValue,
      this.validator,
      this.saveHandler,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    var switchEnabled = enabled;
    return Container(
      decoration:
          BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1), boxShadow: []),
      child: Row(
        children: <Widget>[
          Text(
            label ?? '',
            style: AppTextStyle.formLabel,
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      child: SwitchListTile(
                        activeColor: Color.fromRGBO(58, 102, 242, 1),
                        contentPadding: EdgeInsets.only(right: 0),
                        value: initialValue?.key ?? false,
                        onChanged: switchEnabled
                            ? saveHandler as ValueChanged<bool>?
                            : null,
                      ))))
        ],
      ),
    );
  }
}
