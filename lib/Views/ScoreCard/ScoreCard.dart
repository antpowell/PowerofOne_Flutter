import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Data/Points.dart';
import 'package:power_one/TrackerButton.dart';
import 'package:power_one/Views/ScoreCard/PlaysSection.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoard.dart';
import 'package:power_one/Views/ScoreCard/ShotsSection.dart';

class ScoreCard extends StatelessWidget {
  Points points = new Points(kPoints);

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
                    flex: 1,
                    child: PlaysSection(),
                  ),
                  Expanded(
                    flex: 2,
                    child: ScoreBoard(),
                    // child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: ShotsSection(),
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
