import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoardPointsDisplay.dart';

// ignore: must_be_immutable
class ScoreBoard extends StatelessWidget {
  // List<Widget> _dualScoreSection = [];
  List<Widget> _singleScoreSection = [];

  _createSignleScoreSectionLists(Activities a) {
    a.hustlePointsMap.keys.forEach(
        (element) => _singleScoreSection.add(ScoreBoardPointsDisplay(element)));

    return _singleScoreSection;
  }

  @override
  Widget build(BuildContext context) {
    final Activities activities =
        Provider.of<Activities>(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          child: Text(
            'Player Name',
            style: TextStyle(fontSize: 42, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String name = activities.pointsMap.keys.elementAt(index);
              return ScoreBoardPointsDisplay(name);
            },
            itemCount: activities.pointsMap.length,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        Container(
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8,
            children: _createSignleScoreSectionLists(activities),
          ),
        ),
      ],
    );
  }
}
