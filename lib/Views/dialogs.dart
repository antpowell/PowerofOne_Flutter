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
    String body, {
    Function approveFunction,
    Function disapproveFunction,
  }) async {
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
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PO1Button(
                  "OK",
                  onPress: () => {
                    Navigator.pop(context),
                    approveFunction(),
                  },
                ),
                PO1Button(
                  "Cancel",
                  onPress: () => {Navigator.pop(context), disapproveFunction()},
                ),
              ],
            ),
          ],
        );
      },
    );
    return action ?? DialogAction.abort;
  }

  static Future<DialogAction> okDialogAction(
      BuildContext context, String title, String body,
      {Function approveFunction}) async {
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
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                PO1Button(
                  "OK",
                  onPress: () => {Navigator.pop(context), approveFunction()},
                ),
              ],
            ),
          ],
        );
      },
    );
    return action ?? DialogAction.abort;
  }
}
