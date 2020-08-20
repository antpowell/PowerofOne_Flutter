import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Score/cubit/activities_cubit.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoardPointsDisplay.dart';

// ignore: must_be_immutable
class ScoreBoard extends StatelessWidget {
  List<Widget> _dualScoreSection = [];
  List<Widget> _singleScoreSection = [];
  Activities _activities = new Activities();

  _createDualScoreSectionLists() {
    _activities.pointsMap.forEach((key, value) {
      _dualScoreSection.add(ScoreBoardPointsDisplay(activity: value));
    });

    return _dualScoreSection;
  }

  _createSignleScoreSectionLists() {
    _activities.playsMap.forEach((key, value) {
      _singleScoreSection.add(ScoreBoardPointsDisplay(activity: value));
    });

    return _singleScoreSection;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        direction: Axis.horizontal,
        children: <Widget>[
          Text(
            'Player Name',
            style: TextStyle(fontSize: 42, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Column(children: _createDualScoreSectionLists()),
          Wrap(
            spacing: 24.0,
            runSpacing: 8,
            children: _createSignleScoreSectionLists(),
          )
        ],
      ),
    );
  }
}
