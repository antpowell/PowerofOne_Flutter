import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Objects/Score/Score.dart';
import 'package:power_one/Objects/Score/cubit/score_cubit.dart';

class ScoreBoardPointsDisplay extends StatelessWidget {
  final Score activity;
  ScoreBoardPointsDisplay(this.activity);

  Text _scoreBoardText(label) {
    return Text(
      label,
      style: kLabelTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final Score thisActivity = Activities().pointsMap[activity];
    return buildScoreDisplay(activity);
  }

  Column buildScoreDisplay(Score activity) {
    return Column(
      children: [
        _scoreBoardText(activity.title),
        Container(
          child: (activity is Point)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _scoreBoardText('${activity.pos}'),
                    _scoreBoardText('${activity.neg}'),
                  ],
                )
              : _scoreBoardText('${activity.pos}'),
        ),
      ],
    );
  }
}
