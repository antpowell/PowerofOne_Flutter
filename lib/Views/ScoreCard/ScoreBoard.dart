import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoardPointsDisplay.dart';

// ignore: must_be_immutable
class ScoreBoard extends StatelessWidget {
  List<Widget> _dualScoreSection = [];
  List<Widget> _singleScoreSection = [];

  _createSignleScoreSectionLists(Activities a) {
    a.hustlePointsMap.keys.forEach(
        (element) => _singleScoreSection.add(ScoreBoardPointsDisplay(element)));

    return _singleScoreSection;
  }

  List<Widget> _createDualScoreSectionLists(Activities a) {
    a.pointsMap.keys.forEach(
        (element) => _dualScoreSection.add(ScoreBoardPointsDisplay(element)));

    return _dualScoreSection;
  }

  @override
  Widget build(BuildContext context) {
    final Activities activities =
        Provider.of<Activities>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          'Player Name',
          style: TextStyle(fontSize: 36, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Container(
          child: Column(
            children: _createDualScoreSectionLists(activities),
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
