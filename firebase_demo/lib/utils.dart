import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar() // .. is called cascading method calls
    ..showSnackBar(SnackBar(content: Text(message)));

  // The above is an alternative to this
  // ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
  // messenger.hideCurrentSnackBar();
  // messenger.showSnackBar(SnackBar(content: Text(message)));
}
