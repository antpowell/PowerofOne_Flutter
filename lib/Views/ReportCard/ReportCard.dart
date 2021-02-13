import 'package:flutter/material.dart';
import 'package:power_one/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_one/Views/ScoreCard/ScoreCard.dart';
import 'package:power_one/models/PO1User.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/FeedBack/FeedBack.dart';

import 'dart:developer' as dev;

Column baseColumnButton(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

Column columnTitleTotalPointsScored(int points, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}

class ReportCard extends StatelessWidget {
  const ReportCard({Key key}) : super(key: key);
  static final PO1User _user = PO1User();
  static final String id = 'report_card_screen';

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget feedbacktextSection = Container(
      width: 150,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('FEEDBACK',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              )),
          Column(
            children: [
              Container(
                height: 100,
                width: 145,
                color: Colors.white10,
                child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
    Widget powerof1gradetextSection = Container(
      width: 150,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Power of 1 Grade',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              )),
          Column(
            children: [
              Container(
                height: 100,
                width: 145,
                color: Colors.white10,
                child: Text(_user.score.powerOfOneGrade(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      //backgroundColor: Colors.white24,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
    Widget totalpointstextSection = Container(
      width: 150,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Total Points Scored',
              style: TextStyle(fontSize: 15, color: Colors.white)),
          Container(
            height: 100,
            width: 145,
            color: Colors.white10,
            child: Text(_user.score.getTotalPointsScored().toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 80, color: Colors.white)),
          ),
        ],
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        dev.log('back button disabled');
        // TODO: show dialog message
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom:0,
                right:0,
                left: 300,
                top:0,
              child: Text(
                  'Power of 1 Score',
                  style: TextStyle(
                  fontSize: 45,
                    color: Colors.white,
              ),
              ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: PO1Button(
                  "New Game",
                  onPress: () {
                    _user.clearData();
                    // FIXME: PlayerNameForm's route stacks ontop of each other here. Need to fix with either only allowing a single instance of a route onto the stack or find a more advanced solution.
                    Navigator.popUntil(
                        context, ModalRoute.withName(PlayerNameForm.id));
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                right: 150,
                child: PO1Button(
                  "Feedback",
                  onPress: () {
                    Navigator.pushNamed(context, FeedBack.id);
                  },
                ),
              ),
              Positioned(
                top: 40,
                left: 40,
                child: Container(
                  height: 50,
                  width: 200,
                  child: Text(
                    _user.playerName.toString(),
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //ColumnOne
                  //const SizedBox(width:50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /* Text('Player Name',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      )
                  ),*/
                      totalpointstextSection,
                    ],
                  ),
                  // const SizedBox(width:50),
                  Container(
                    height: 210,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1.5, color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                  //ColumnTwo
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      powerof1gradetextSection,
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
