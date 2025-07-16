import 'package:flutter/material.dart';

import '../entities/key_value.dart';

/// 用户状态
const List<KeyValue> userStatusConst = <KeyValue>[
  KeyValue('true', '正常', color: Color(0xFF1677FF)),
  KeyValue('false', '禁用', color: Color(0xFFFD8428)),
];

/// 用户性别
const List<KeyValue> userGenderConst = <KeyValue>[
  KeyValue('0', '未知'),
  KeyValue('1', '男'),
  KeyValue('2', '女'),
];
