import 'package:flutter/material.dart';
import 'package:power_one/models/PO1Point.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoardPointsDisplay.dart';

// ignore: must_be_immutable
class ScoreBoard extends StatelessWidget {
  List<Widget> _dualScoreSection = [];
  List<Widget> _singleScoreSection = [];

  _createSingleScoreSectionLists(PO1Score a) {
    a.hustlePointsMap.keys.forEach((element) =>
        _singleScoreSection.add(ScoreBoardPointsDisplay(element.name)));

    return _singleScoreSection;
  }

  List<Widget> _createDualScoreSectionLists(PO1Score a) {
    a.pointsMap.keys.forEach((element) =>
        _dualScoreSection.add(ScoreBoardPointsDisplay(element.translatedName)));

    return _dualScoreSection;
  }

  @override
  Widget build(BuildContext context) {
    final PO1Score activities = Provider.of<PO1Score>(context, listen: false);

    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          child: Column(
            children: _createDualScoreSectionLists(activities),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _createSingleScoreSectionLists(activities),
          ),
        ),
      ],
    );
  }
}
