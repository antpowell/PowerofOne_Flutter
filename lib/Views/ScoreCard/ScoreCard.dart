import 'package:flutter/material.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Services/database_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/FeedBack/FeedBack.dart';
import 'package:power_one/Views/ReportCard/ReportCard.dart';
import 'package:power_one/Views/ScoreCard/hustle_points_section.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoard.dart';
import 'package:power_one/Views/ScoreCard/points_section.dart';
import 'package:power_one/Views/dialogs.dart';
import 'package:power_one/models/PO1Feedback.dart';
import 'package:power_one/models/PO1User.dart';
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
  static final fbdbService = FBDBService();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _user.playerName.toString(),
            style: TextStyle(fontSize: 36, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
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
          ),
          Flexible(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: PO1Button(
                    'Back',
                    onPress: () {
                      Dialogs.yesAbortDialogAction(context, "Erase User",
                          "You are about to go back. This Player will be erased and the data for this game along with it. Are you sure you want to go back?");
                    },
                    onLongPress: () {
                      Navigator.pop(context);
                    },
                    onLeft: true,
                    icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                  ),
                ),
                Container(
                  child: PO1Button(
                    "Undo",
                    onPress: Provider.of<PO1Score>(context).undo,
                    onLongPress: Provider.of<PO1Score>(context).clear,
                    icon: Icon(Icons.restore_outlined, color: Colors.white),
                  ),
                ),
                Container(
                  child: PO1Button('Game Summary', onPress: () {
                    _user.setPlayerScore(
                        Provider.of<PO1Score>(context, listen: false));
                    PO1Feedback.calculateFeedback(_user.score);
                    fbdbService.createNewGame();
                    Navigator.pushNamed(context, FeedBack.id);
                  },
                      icon: Icon(Icons.arrow_forward_ios_sharp,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
