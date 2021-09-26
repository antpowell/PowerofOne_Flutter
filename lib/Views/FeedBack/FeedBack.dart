import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Services/database_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/ReportCard/ReportCard.dart';
import 'package:power_one/Views/dialogs.dart';
import 'package:power_one/models/PO1Feedback.dart';
import 'package:power_one/models/PO1User.dart';
import 'package:provider/provider.dart';

class FeedBack extends StatelessWidget {
  static final String id = 'feedback_screen';
  static final _fbdbService = FBDBService();
  const FeedBack({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final PO1User _user = PO1User();

    Color color = Theme.of(context).primaryColor;

    Widget _buildFeedbackContent() {
      return Expanded(
        flex: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
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
                              _user.score.getAverages()['FG'].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(PO1Feedback.scoredpointsfeedback['FG'],
                              // ._user
                              // .score
                              // .feedback(_user.score.getAverages())['FG']
                              // .toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
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
                              _user.score.getAverages()['1PT'].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(PO1Feedback.scoredpointsfeedback['1PT'],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
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
                        Text("Rebounds:",
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
                              _user.score.hustlePointsMap['RB'].pos.toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(PO1Feedback.hustlepointsfeedback['RB'],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
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
                              _user.score.hustlePointsMap['BLK'].pos.toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(PO1Feedback.hustlepointsfeedback['BLK'],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
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
                              _user.score.hustlePointsMap['STL'].pos.toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(PO1Feedback.hustlepointsfeedback['STL'],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
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
                              _user.score.hustlePointsMap['AST'].pos.toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(PO1Feedback.hustlepointsfeedback['AST'],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
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
                              _user.score.hustlePointsMap['TO'].pos.toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(PO1Feedback.hustlepointsfeedback['TO'],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
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

    Widget _buildNavigationFooter() {
      return Flexible(
        flex: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: PO1Button(
                'Back',
                onPress: () {
                  Navigator.pop(context);
                },
                onLeft: true,
                icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
              ),
            ),
            Container(
              child: PO1Button(
                "Report Card",
                onPress: () {
                  Dialogs.yesAbortDialogAction(
                      context,
                      '⚠ Is the game really over? ⚠',
                      'Press \'OK\' to save this game BUT you will not be able to make any addtional changes to this game.\n\nPress \'Cancel\' to close this dialog and continue reviewing current game details.',
                      approveFunction: () {
                    _user.setPlayerScore(
                        Provider.of<PO1Score>(context, listen: false));
                    PO1Feedback.calculateFeedback(_user.score);
                    _fbdbService.createNewGame();
                    Navigator.pushNamed(context, ReportCard.id);
                  });
                },
                onLongPress: () => {},
                icon: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
        height: double.infinity,
        width: double.infinity,
        child: Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildFeedbackContent(),
              _buildNavigationFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
