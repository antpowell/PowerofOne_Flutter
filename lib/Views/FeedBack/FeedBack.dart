import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Objects/PO1Score.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Power of 1 Score FeedBack',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Text("\n"),
                  Row(
                    children: [
                      Text("Field Goal Percentage:",
                          style: TextStyle(
                            color: Colors.white,fontSize: 20,
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text(_user.score.getAverages()['FG'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10.0),
                       child: Text(
                            _user.score.feedback(_user.score.getAverages())['FG'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
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
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            _user.score.feedback(_user.score.getAverages())['1PT'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
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
                      child: Text( _user.score.hustlePointsMap['ORB'].pos.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          _user.score.hustlepointsfeedback(_user.score.hustlePointsMap)['ORB'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white)),
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
                            _user.score.hustlePointsMap['BLKS'].pos.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            _user.score.hustlepointsfeedback(_user.score.hustlePointsMap)['BLKS'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Steals:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:20,
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
                            _user.score.hustlePointsMap['STLS'].pos.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            _user.score.hustlepointsfeedback(_user.score.hustlePointsMap)['STLS'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
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
                            _user.score.hustlePointsMap['ASST'].pos.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            _user.score.hustlepointsfeedback(_user.score.hustlePointsMap)['ASST'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
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
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            _user.score.hustlepointsfeedback(_user.score.hustlePointsMap)['TO'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
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
}
