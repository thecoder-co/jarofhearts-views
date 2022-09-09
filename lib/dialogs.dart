import 'package:flutter/material.dart';

class Dialogs {
  static void loadDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const CircularProgressIndicator.adaptive());
  }
}
