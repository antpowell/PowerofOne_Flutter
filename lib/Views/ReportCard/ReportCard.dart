//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:power_one/models/User.dart';

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
  static final User _user = User();

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Power of 1 Score',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              right: 10,
              child: OutlineButton(
                disabledBorderColor: Colors.white,
                child: Text("New Game",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 150,
              child: OutlineButton(
                disabledBorderColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/playerName');
                },
                child: Text(
                  "Save Game",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
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
                Container(
                  height: 210,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 1.5, color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    feedbacktextSection,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
