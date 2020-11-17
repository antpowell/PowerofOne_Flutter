import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Point.dart';

class ScoreBoardPointsDisplay extends StatelessWidget {
  final String activityName;
  ScoreBoardPointsDisplay(this.activityName);

  Text _scoreBoardLabelText(label) {
    return Text(
      label,
      style: kScoreBoardLabelsTextStyle,
    );
  }

  Text _scoreBoardPointText(label, color) {
    return Text(
      label,
      style: kScoreBoardPointsTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _scoreBoardLabelText(activityName),
        Consumer<Activities>(
          builder: (context, activitiesProvider, child) => Container(
            child: (activitiesProvider.getActivity(activityName) is Point)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: _scoreBoardPointText(
                            activitiesProvider
                                .getActivity(activityName)
                                .pos
                                .toString(),
                            Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: _scoreBoardPointText(
                            activitiesProvider
                                .getActivity(activityName)
                                .neg
                                .toString(),
                            Colors.red),
                      ),
                    ],
                  )
                : _scoreBoardPointText(
                    activitiesProvider.getActivity(activityName).pos.toString(),
                    Colors.white),
          ),
        ),
      ],
    );
  }
}
