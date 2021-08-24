import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/models/PO1Feedback.dart';
import 'package:power_one/models/PO1User.dart';

class FeedBack extends StatelessWidget {
  static final String id = 'feedback_screen';
  const FeedBack({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final PO1User _user = PO1User();

    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      body: SafeArea(
        child: Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Power of 1 Feedback',
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("\n"),
                            Row(
                              children: [
                                Text("Field Goal Percentage:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      _user.score
                                          .getAverages()['FG']
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      PO1Feedback.scoredpointsfeedback['FG'],
                                      // ._user
                                      // .score
                                      // .feedback(_user.score.getAverages())['FG']
                                      // .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("\n"),
                                Text("Free Throw Percentage:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      _user.score
                                          .getAverages()['1PT']
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      PO1Feedback.scoredpointsfeedback['1PT'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\n"),
                            Row(
                              children: [
                                Text("Offensive Rebounds:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      _user.score.hustlePointsMap['ORB'].pos
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      PO1Feedback.hustlepointsfeedback['ORB'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("\n"),
                                Text("Blocks:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      _user.score.hustlePointsMap['BLK'].pos
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      PO1Feedback.hustlepointsfeedback['BLK'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Steals:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      _user.score.hustlePointsMap['STL'].pos
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      PO1Feedback.hustlepointsfeedback['STL'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Assists:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      _user.score.hustlePointsMap['AST'].pos
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      PO1Feedback.hustlepointsfeedback['AST'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Turnovers:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      _user.score.hustlePointsMap['TO'].pos
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      PO1Feedback.hustlepointsfeedback['TO'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: PO1Button(
                    "Undo",
                    onPress: () => {},
                    onLongPress: () => {},
                    icon: Icon(Icons.arrow_right, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
