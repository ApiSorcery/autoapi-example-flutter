import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:flutter/material.dart';

// Filter sidebar input field
ListTile filterInput(
    BuildContext context, String? title, TextEditingController controller) {
  return ListTile(
      title: Text(title ?? 'None', style: AppTextStyle.filterLabel),
      subtitle: TextField(
        style: AppTextStyle.filterValue,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(0, 0, 0, 0.12), width: 1)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 1))),
        controller: controller,
      ));
}

// Filter sidebar dropdown
ListTile filterSelect(String? title, childWidget) {
  return ListTile(
    title: Text(title ?? 'None', style: AppTextStyle.filterLabel),
    subtitle: childWidget,
  );
}

// Drawer bottom button component
Widget filterButton(
    BuildContext context, Function clearFunc, Function commitFunc) {
  return Expanded(
      child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(left: 16, bottom: 21, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.all(8),
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                          textStyle: TextStyle(fontSize: 16)),
                      child: const Text('Clear'),
                      onPressed: () => clearFunc())),
              const Padding(padding: EdgeInsets.all(8)),
              Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.all(8),
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                          textStyle: TextStyle(fontSize: 16)),
                      child: const Text('Confirm'),
                      onPressed: () => commitFunc()))
            ],
          )));
}
