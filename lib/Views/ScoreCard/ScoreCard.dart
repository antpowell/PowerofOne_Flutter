import 'package:flutter/material.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Services/database_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/FeedBack/FeedBack.dart';
import 'package:power_one/Views/ScoreCard/hustle_points_section.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoard.dart';
import 'package:power_one/Views/ScoreCard/points_section.dart';
import 'package:power_one/Views/dialogs.dart';
import 'package:power_one/models/PO1Feedback.dart';
import 'package:power_one/models/PO1User.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as dev;

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
  static final fbdbService = FBDBService();
  @override
  Widget build(BuildContext context) {
    void backButtonHandler() {
      dev.log('ScoreCard back button engaged');

      _user.setPlayerScore(Provider.of<PO1Score>(context, listen: false));

      Dialogs.yesAbortDialogAction(context, "Erase User",
          "You are about to go back. This Player will be erased and the data for this game along with it. Are you sure you want to go back?",
          approveFunction: () {
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
                Container(
                  child: PO1Button('Summary Card', onPress: () {
                    _user.setPlayerScore(
                        Provider.of<PO1Score>(context, listen: false));
                    PO1Feedback.calculateFeedback(_user.score);
                    // fbdbService.createNewGame();
                    Navigator.pushNamed(context, FeedBack.id);
                  },
                      icon: Icon(Icons.arrow_forward_ios_sharp,
                          color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
