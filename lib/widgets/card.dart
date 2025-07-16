import 'package:autoapi_example_flutter/entities/key_value.dart';
import 'package:flutter/material.dart';

// 列表页Card标题
Widget cardTitleStatus(BuildContext context, String? title, String status,
    List<KeyValue> options) {
  var option = options.firstWhere((KeyValue r) => r.id == status,
      orElse: () => const KeyValue('', '暂无', color: Colors.black87));
  return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title ?? '暂无',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              Text(
                option.name,
                style: TextStyle(
                    fontSize: 14,
                    color: option.color,
                    fontWeight: FontWeight.w500),
                softWrap: true,
              ),
              const Icon(
                Icons.chevron_right,
                color: Color.fromRGBO(153, 153, 153, 1),
                size: 24,
              )
            ],
          ),
        ],
      ));
}

// 列表页文本
Padding cardText(title, text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 16, 8),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text((title ?? '').isEmpty ? '暂无' : title,
              style: const TextStyle(color: Colors.black87))),
      Text(
        (text ?? '').isEmpty ? '暂无' : text,
        style: const TextStyle(color: Colors.black87),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    ]),
  );
}

// 清单状态文本
Padding cardSelect({String? title, String? value, List<KeyValue>? options}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 16, 8),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(title ?? '暂无', style: TextStyle(color: Colors.black87))),
      Text(
        options?.firstWhere((KeyValue r) => r.id == value).name ?? '暂无',
        style: TextStyle(
            fontSize: 15,
            color: (options?.firstWhere((KeyValue r) => r.id == value) ??
                        {} as KeyValue)
                    .color ??
                Colors.black87,
            fontWeight: FontWeight.normal),
        softWrap: true,
      ),
    ]),
  );
}

// 暂无数据卡片
Container cardEmpty({String emptyText = '暂无数据'}) {
  return Container(
    height: 64,
    decoration: BoxDecoration(
        color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
    child:
        Center(child: Text(emptyText, style: TextStyle(color: Colors.black87))),
  );
}
