import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';

enum DialogAction { yes, abort }

const TextStyle textStyle = TextStyle(
  color: Colors.white,
);

class Dialogs {
  static Future<DialogAction> yesAbortDialogAction(
    BuildContext context, {
    required RichText title,
    required RichText body,
    Function? approveFunction,
    Function? disapproveFunction,
  }) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: title,
          content: body,
          actions: <Widget>[
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PO1Button(
                  "Cancel",
                  onPress: () => {
                    Navigator.pop(context),
                    disapproveFunction?.call(),
                  },
                ),
                PO1Button(
                  "OK",
                  onPress: () => {
                    Navigator.pop(context),
                    approveFunction?.call(),
                  },
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
    BuildContext context, {
    String? title,
    String? body,
    Function? approveFunction,
  }) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: (title != null && title.isNotEmpty)
              ? Text(
                  title,
                  style: textStyle,
                )
              : null,
          content: (body != null && body.isNotEmpty)
              ? Text(
                  body,
                  style: textStyle,
                )
              : null,
          actions: <Widget>[
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                PO1Button(
                  "OK",
                  onPress: () => {
                    Navigator.pop(context),
                    approveFunction != null && approveFunction.call(),
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
    return action ?? DialogAction.abort;
  }

  static Future<AlertDialog> loadingDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: RichText(
              text: (TextSpan(
                text: '',
                style: textStyle,
              )),
            ),
            content: SpinKitCircle(
              color: Colors.white,
              size: 100.0,
            ),
            actions: null);
      },
    );
  }
}
