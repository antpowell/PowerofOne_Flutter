import 'package:flutter/material.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/ScoreCard/hustle_points_section.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoard.dart';
import 'package:power_one/Views/ScoreCard/points_section.dart';
import 'package:power_one/models/PO1User.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

class ScoreCard extends StatelessWidget {
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
                    onPress: () {},
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
                  child: PO1Button('Report Card', onPress: () {
                    _user.setPlayerScore(
                        Provider.of<PO1Score>(context, listen: false));
                    Navigator.pushNamed(context, '/reportCard');
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
