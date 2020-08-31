import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Score/cubit/activities_cubit.dart';
import 'package:power_one/TrackerButton.dart';
import 'package:power_one/Views/ScoreCard/hustle_points_section.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoard.dart';
import 'package:power_one/Views/ScoreCard/points_section.dart';

class ScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScoreCardScreen();
  }
}

class ScoreCardScreen extends StatelessWidget {
  const ScoreCardScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Row(
                // TODO: TRYING TO IMPLEMENT THE COMMAND PATTEREN
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: HustlePointsSection(),
                  ),
                  Expanded(
                    flex: 3,
                    child: ScoreBoard(),
                    // child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: PointsSection(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Reset Player'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      // TODO: Reset point or maybe pop point off top of stack
                    },
                    child: Text('Rest Points'),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text('PowerOf1 ReportCard'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
