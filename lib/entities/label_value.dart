import 'package:flutter/material.dart';

class LabelValue extends Object {
  String label;
  String? value;
  Color? color;
  Function? onTapped;
  LabelValue(this.label, this.value, {this.onTapped, this.color});
}
