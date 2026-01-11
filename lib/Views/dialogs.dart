import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:power_of_one_basketball/Views/Buttons/PO1Button.dart';
import 'package:power_of_one_basketball/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_of_one_basketball/Views/ScoreCard/ScoreCard.dart';

enum DialogAction { yes, abort }

const TextStyle textStyle = TextStyle(color: Colors.white);

class Dialogs {
  static Future<DialogAction> yesAbortDialogAction(
    BuildContext context, {
    required RichText title,
    required RichText body,
    Function? approveFunction,
    Function? disapproveFunction,
  }) async {
    DialogAction action = DialogAction.abort;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final NavigatorState navigator = Navigator.of(context);

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
                    navigator.pop(),
                    disapproveFunction?.call(),
                    action = DialogAction.abort,
                  },
                ),
                PO1Button(
                  "OK",
                  onPress: () => {
                    navigator.pop(),
                    approveFunction?.call(),
                    action = DialogAction.yes,
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
    return action;
  }

  static Future<DialogAction> okDialogAction(
    BuildContext context, {
    String? title,
    String? body,
    Function? approveFunction,
    bool claimSubscription = false,
  }) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        int _actions = 0;
        Timer? _timer;
        int _stepsBack = 2;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: (title != null && title.isNotEmpty)
              ? TextButton(
                  child: Text(title, style: textStyle),
                  onPressed: () {
                    if (!claimSubscription) {
                    } else {
                      _timer = Timer(
                        const Duration(seconds: 2),
                        () => _actions = 0,
                      );
                      _actions++;
                      if (_actions == 5) {
                        Navigator.pop(context);
                      }
                    }
                  },
                )
              : null,
          content: (body != null && body.isNotEmpty)
              ? TextButton(
                  child: Text(body, style: textStyle),
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                    enableFeedback: false,
                  ),
                  onPressed: () {
                    if (!claimSubscription) {
                    } else {
                      _timer = Timer(
                        const Duration(seconds: 2),
                        () => _actions = 0,
                      );
                      _actions++;
                    }
                  },
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
                    if (claimSubscription && _actions == 5)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Action completed'),
                            behavior: SnackBarBehavior
                                .floating, // Makes it look more like a toast
                            duration: const Duration(seconds: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Navigator.pop(context),
                        Navigator.popAndPushNamed(context, ScoreCard.id),
                      }
                    else
                      {
                        Navigator.pop(context),
                        approveFunction != null && approveFunction.call(),
                      },
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
            text: (TextSpan(text: '', style: textStyle)),
          ),
          content: SpinKitCircle(color: Colors.white, size: 100.0),
          actions: null,
        );
      },
    );
  }
}
