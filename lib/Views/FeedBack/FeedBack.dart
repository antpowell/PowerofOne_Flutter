import 'package:flutter/material.dart';
import 'package:power_one/Main.dart';
import 'package:power_one/Models/PO1Feedback.dart';
import 'package:power_one/Models/PO1HustlePoint.dart';
import 'package:power_one/Models/PO1User.dart';
import 'package:power_one/Services/database_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';

class FeedBack extends StatelessWidget {
  static final String id = 'feedback_screen';
  static final _fbdbService = FBDBService();
  final String? title;
  const FeedBack({Key? key, this.title}) : super(key: key);

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
                          child: Text(
                              PO1Feedback.scoredPointsFeedbackObj['FG'] ?? 'NA',
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
                          child: Text(
                              PO1Feedback.scoredPointsFeedbackObj['1PT'] ??
                                  'NA',
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
                              _user.score.hustlePointsMap[EHustlePoint.RB]?.pos
                                      .toString() ??
                                  'NA',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                              PO1Feedback.hustlePointsFeedbackObj['RB'] ?? 'NA',
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
                              _user.score.hustlePointsMap[EHustlePoint.BLK]?.pos
                                      .toString() ??
                                  'NA',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                              PO1Feedback.hustlePointsFeedbackObj['BLK'] ??
                                  'NA',
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
                              _user.score.hustlePointsMap[EHustlePoint.STL]?.pos
                                      .toString() ??
                                  'NA',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                              PO1Feedback.hustlePointsFeedbackObj['STL'] ??
                                  'NA',
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
                              _user.score.hustlePointsMap[EHustlePoint.AST]?.pos
                                      .toString() ??
                                  'NA',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                              PO1Feedback.hustlePointsFeedbackObj['AST'] ??
                                  'NA',
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
                              _user.score.hustlePointsMap[EHustlePoint.TO]?.pos
                                      .toString() ??
                                  'NA',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                              PO1Feedback.hustlePointsFeedbackObj['TO'] ?? 'NA',
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
            // Container(
            //   child: PO1Button(
            //     "Report Card",
            //     onPress: () {
            //       Dialogs.yesAbortDialogAction(
            //           context,
            //           '⚠ Is the game really over? ⚠',
            //           'Press \'OK\' to save this game BUT you will not be able to make any addtional changes to this game.\n\nPress \'Cancel\' to close this dialog and continue reviewing current game details.',
            //           approveFunction: () {
            //         _user.setPlayerScore(
            //             Provider.of<PO1Score>(context, listen: false));
            //         PO1Feedback.calculateFeedback(_user.score);
            //         _fbdbService.createNewGame();
            //         Navigator.pushNamed(context, ReportCard.id);
            //       });
            //     },
            //     onLongPress: () => {},
            //     icon: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
            //   ),
            // ),
            Container(
              child: PO1Button(
                "New Game",
                onPress: () {
                  _user.clearData();
                  // FIXME: PlayerNameForm's route stacks ontop of each other here. Need to fix with either only allowing a single instance of a route onto the stack or find a more advanced solution.
                  Navigator.pushAndRemoveUntil(
                      // user AuthWrapper in stead of LoginForm
                      context,
                      MaterialPageRoute(builder: (builder) => AuthWrapper()),
                      (route) => false);
                },
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
    );
  }
}
