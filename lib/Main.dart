import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:power_one/Views/LoginSignUp/SigninSignup.dart';
import 'package:power_one/Views/ReportCard/ReportCard.dart';
import 'package:power_one/Views/ScoreCard/ScoreCard.dart';

import 'Views/PlayerName/PlayerName.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(Power1());
}

class Power1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Power of 1 Basketball',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff33333D),
        dialogBackgroundColor: Color(0xff33333D),
        backgroundColor: Color(0xff33333D),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SigninSignup(),
        '/register': (context) => SigninSignup(),
        '/playerName': (context) => PlayerNameScene(),
        '/scoreCard': (context) => ScoreCard(),
        '/power1ScoreCard': (context) => ReportCard(),
      },
      // home: Scaffold(
      //   backgroundColor: Color(0xff33333D),
      //   resizeToAvoidBottomPadding: false,
      //   resizeToAvoidBottomInset: false,
      //   body: SafeArea(
      //     child: ScoreCard(),
      //   ),
      // ),
    );
  }
}

class PointKeeper extends StatefulWidget {
  PointKeeper({@required this.mainLabel});

  final String mainLabel;
  @override
  _PointKeeperState createState() =>
      _PointKeeperState(mainLabel: this.mainLabel);
}

class _PointKeeperState extends State<PointKeeper> {
  _PointKeeperState({this.mainLabel});

  final String mainLabel;

  int points = 0;

  void reset() => setState(() {
        points = 0;
      });

  @override
  Widget build(BuildContext context) {
    Widget pointKeeper(String mainLabel) {
      int increasePoints() {
        setState(() {
          points++;
        });
        return points;
      }

      int decreasePoints() {
        if (points > 0) {
          setState(() {
            points--;
          });
        }
        return points;
      }

      Widget button(String label, Function action) {
        return FlatButton(
          onPressed: () {
            action();
            print('someone Pressed $label to $mainLabel');
          },
          onLongPress: () {
            print('someone long pressed $label');
          },
          color: Colors.blue,
          child: Text(label),
        );
      }

      return Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: button('+', increasePoints),
          ),
          Flexible(
            flex: 2,
            child: Card(
              elevation: 5,
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: ListTile(
                title: Text(
                  points.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 32),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  mainLabel,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: button('-', decreasePoints),
          ),
        ],
      );
    }

    return Container(child: pointKeeper(mainLabel), width: 180);
  }
}

class Reset extends StatelessWidget {
  Reset({this.action});
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {
            action();
            print('someone Pressed reset');
          },
          child: Text('Reset')),
    );
  }
}
