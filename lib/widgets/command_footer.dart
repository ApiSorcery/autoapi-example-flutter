import 'dart:async';

import 'package:autoapi_example_flutter/entities/label_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:autoapi_example_flutter/utils/style.dart';

class CommandFooter extends StatefulWidget {
  final CommandFooterData commandFooterData;
  const CommandFooter({super.key, required this.commandFooterData});
  @override
  State<CommandFooter> createState() => _CommandFooterState();
}

class _CommandFooterState extends State<CommandFooter> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          // Shadow
          BoxShadow(
              color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: commandDetails(widget.commandFooterData.details),
            ),
            commandsContainer(context, widget.commandFooterData),
          ],
        ));
  }

  Widget commandsContainer(
      BuildContext context, CommandFooterData commandFooterData) {
    if (commandFooterData.commands.length == 1) {
      var command = commandFooterData.commands[0];
      return Container(
          color: Theme.of(context).primaryColor,
          width: 100,
          height: 56,
          child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                disabledBackgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Set to zero means no rounded corners
                ),
              ),
              onPressed: _loading
                  ? null
                  : () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        _loading = true;
                      });
                      if (command.callback != null) {
                        try {
                          await command.callback!(context);
                        } finally {
                          setState(() {
                            _loading = false;
                          });
                        }
                      }
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(command.name,
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF))),
                  _loading
                      ? const SpinKitFadingCircle(
                          color: Colors.white,
                          size: 15.0,
                        )
                      : const SizedBox.shrink()
                ],
              )));
    } else if (commandFooterData.commands.length > 1) {
      return Container(
        color: Theme.of(context).primaryColor,
        width: 100,
        height: 56,
        child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
              disabledBackgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Set to zero means no rounded corners
              ),
            ),
            onPressed: _loading
                ? null
                : () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                            height:
                                commandFooterData.commands.length * 60.0 + 10,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: commandFooterData.commands.map((r) {
                                  return TextButton(
                                    style: TextButton.styleFrom(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Container(
                                        padding: const EdgeInsets.all(12.0),
                                        width: double.infinity,
                                        child: Text(r.name,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0x8A000000)))),
                                    onPressed: () async {
                                      setState(() {
                                        _loading = true;
                                      });
                                      Navigator.pop(context);
                                      if (r.callback != null) {
                                        try {
                                          await r.callback!(context);
                                        } finally {
                                          setState(() {
                                            _loading = false;
                                          });
                                        }
                                      }
                                    },
                                  );
                                }).toList()));
                      },
                    );
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(commandFooterData.commandsTitle,
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF))),
                _loading
                    ? const SpinKitFadingCircle(
                        color: Colors.white,
                        size: 15.0,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
              ],
            )),
      );
    } else {
      return Container();
    }
  }

  Widget commandDetails(List<LabelValue>? details) {
    return (details ?? <LabelValue>[]).isEmpty
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: details!.map((r) {
                  return labelValueField(r.label, r.value);
                }).toList()));
  }

  Widget labelValueField(String label, String? value) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(color: Color(0xFF999999), fontSize: 14.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              value ?? 'None',
              maxLines: 2,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommandFooterData {
  List<LabelValue>? details;
  String commandsTitle;
  List<FooterCommand> commands;
  CommandFooterData(
      {this.details, required this.commandsTitle, required this.commands});
}

typedef Callback = Future Function(BuildContext context);

class FooterCommand {
  String name;
  Callback? callback;
  FooterCommand(this.name, this.callback);
}
