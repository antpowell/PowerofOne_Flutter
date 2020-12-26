import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';

enum DialogAction { yes, abort }

const TextStyle textStyle = TextStyle(
  color: Colors.white,
);

class Dialogs {
  static Future<DialogAction> yesAbortDialogAction(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            title,
            style: textStyle,
          ),
          content: Text(
            body,
            style: textStyle,
          ),
          actions: <Widget>[
            PO1Button(
              "OK",
              onPress: () => {
                Navigator.of(context).pop(DialogAction.yes),
              },
            ),
            PO1Button(
              "Cancel",
              onPress: () => {
                Navigator.of(context).pop(DialogAction.abort),
              },
            ),
          ],
        );
      },
    );
    return action ?? DialogAction.abort;
  }

  static Future<DialogAction> okDialogAction(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            title,
            style: textStyle,
          ),
          content: Text(
            body,
            style: textStyle,
          ),
          actions: <Widget>[
            PO1Button(
              "OK",
              onPress: () => {
                Navigator.of(context).pop(DialogAction.yes),
              },
            ),
          ],
        );
      },
    );
    return action ?? DialogAction.abort;
  }
}
