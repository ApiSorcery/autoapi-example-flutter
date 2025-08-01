import 'package:autoapi_example_flutter/entities/key_value.dart';
import 'package:flutter/material.dart';

// List page Card title
Widget cardTitleStatus(BuildContext context, String? title, String status,
    List<KeyValue> options) {
  var option = options.firstWhere((KeyValue r) => r.id == status,
      orElse: () => const KeyValue('', 'None', color: Colors.black87));
  return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title ?? 'None',
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

// List page text
Padding cardText(title, text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 16, 8),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(bottom: 4, right: 4),
          child: Text((title ?? '').isEmpty ? 'None' : title,
              style: const TextStyle(color: Colors.black87))),
      Text(
        (text ?? '').isEmpty ? 'None' : text,
        style: const TextStyle(color: Colors.black87),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    ]),
  );
}

// List status text
Padding cardSelect({String? title, String? value, List<KeyValue>? options}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 16, 8),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(bottom: 4, right: 4),
          child:
              Text(title ?? 'None', style: TextStyle(color: Colors.black87))),
      Text(
        options?.firstWhere((KeyValue r) => r.id == value).name ?? 'None',
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

// No data card
Container cardEmpty({String emptyText = 'No data'}) {
  return Container(
    height: 64,
    decoration: BoxDecoration(
        color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
    child:
        Center(child: Text(emptyText, style: TextStyle(color: Colors.black87))),
  );
}
