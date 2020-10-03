import 'package:flutter/material.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Views/ScoreCard/hustle_points_section.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoard.dart';
import 'package:power_one/Views/ScoreCard/points_section.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: RaisedButton.icon(
                      onPressed: () => {},
                      onLongPress: () => {Navigator.pop(context)},
                      label: Text('Back'),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: RaisedButton.icon(
                      onPressed: Provider.of<Activities>(context).undo,
                      label: Text("Undo"),
                      icon: Icon(Icons.refresh),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: RaisedButton.icon(
                      onPressed: () => {
                        dev.log("Player + Game data to be sent",
                            name: "Report Card Button pressed")
                      },
                      // icon: Icon(Icons.arrow_back_ios),
                      icon: Icon(null),
                      label: Text("Report Card"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
