import 'package:flutter/material.dart';

// Loading component
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).colorScheme.primary)),
            ),
            Text(
              'Loading...',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 20),
            ), //
          ]),
    );
  }
}
