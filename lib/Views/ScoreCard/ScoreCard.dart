import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:power_one/Models/PO1Feedback.dart';
import 'package:power_one/Models/PO1User.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Services/database_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/ReportCard/ReportCard.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoard.dart';
import 'package:power_one/Views/ScoreCard/hustle_points_section.dart';
import 'package:power_one/Views/ScoreCard/points_section.dart';
import 'package:power_one/Views/dialogs.dart';
import 'package:provider/provider.dart';

class ScoreCard extends StatelessWidget {
  static final String id = 'score_card_screen';
  @override
  Widget build(BuildContext context) {
    return ScoreCardScreen();
  }
}

class ScoreCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScoreCardScreenWidget(),
    );
  }
}

class ScoreCardScreenWidget extends StatelessWidget {
  static final PO1User _user = PO1User();
  static final _fbdbService = FBDBService();
  @override
  Widget build(BuildContext context) {
    void backButtonHandler() {
      dev.log('ScoreCard back button engaged');

      _user.setPlayerScore(Provider.of<PO1Score>(context, listen: false));

      Dialogs.yesAbortDialogAction(context,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Are you sure you want to go back?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
          ),
          body: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Going back will erase your current game state.\n",
                ),
              ],
            ),
          ), approveFunction: () {
        _user.score.clear();
        Navigator.pop(context);
      });
    }

    return WillPopScope(
      onWillPop: () async {
        backButtonHandler();
        return false;
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
        height: double.infinity,
        width: double.infinity,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _user.playerName.toString(),
              style: TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  child: HustlePointsSection(),
                ),
                Expanded(
                  flex: 2,
                  child: ScoreBoard(),
                ),
                Expanded(
                  child: PointsSection(),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: PO1Button(
                    'Back',
                    onPress: () {
                      backButtonHandler();
                    },
                    onLeft: true,
                    icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                  ),
                ),
                Container(
                  child: PO1Button(
                    "Undo",
                    onPress: Provider.of<PO1Score>(context).undo,
                    // onLongPress: Provider.of<PO1Score>(context).clear,
                    icon: Icon(Icons.restore_outlined, color: Colors.white),
                  ),
                ),
                // Container(
                //   child: PO1Button('Summary Card', onPress: () {
                //     _user.setPlayerScore(
                //         Provider.of<PO1Score>(context, listen: false));
                //     PO1Feedback.calculateFeedback(_user.score);
                //     // fbdbService.createNewGame();
                //     Navigator.pushNamed(context, ReportCard.id);
                //   },
                //       icon: Icon(Icons.arrow_forward_ios_sharp,
                //           color: Colors.white)),
                // ),
                Container(
                  child: PO1Button(
                    "End Game",
                    onPress: () {
                      Dialogs.yesAbortDialogAction(
                        context,
                        title: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child:
                                    Icon(Icons.warning, color: Colors.yellow),
                              ),
                              TextSpan(
                                  // text: 'Is the game really over?',
                                  text: 'Warning',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.red)),
                              WidgetSpan(
                                child:
                                    Icon(Icons.warning, color: Colors.yellow),
                              ),
                            ],
                          ),
                        ),
                        body: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'This is a permanent action, you will not be able to return.\n',
                              ),
                              TextSpan(
                                text: 'Press OK to finish the current game.\n',
                              ),
                            ],
                          ),
                        ),
                        approveFunction: () {
                          _user.setPlayerScore(
                              Provider.of<PO1Score>(context, listen: false));
                          PO1Feedback.calculateFeedback(_user.score);
                          _fbdbService.createNewGame();
                          Navigator.pushNamed(context, ReportCard.id);
                        },
                      );
                    },
                    onLongPress: () => {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
