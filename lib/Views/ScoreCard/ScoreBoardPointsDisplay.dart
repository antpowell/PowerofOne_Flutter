import 'package:flutter/material.dart';
import 'package:power_one/Objects/Score/Score.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/PO1Score.dart';
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
    return Consumer<PO1Score>(
      builder: (context, activitiesProvider, child) => Container(
        child: (activitiesProvider.getActivity(activityName) is Point)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: _scoreBoardPointText(
                        getScoreBoardPointText(
                            activity:
                                activitiesProvider.getActivity(activityName),
                            lookupValue: IScoreLookupValue.pos),
                        Colors.green),
                  ),
                  _scoreBoardLabelText(activityName),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: _scoreBoardPointText(
                        getScoreBoardPointText(
                            activity:
                                activitiesProvider.getActivity(activityName),
                            lookupValue: IScoreLookupValue.neg),
                        Colors.red),
                  ),
                ],
              )
            : Column(
                children: [
                  _scoreBoardLabelText(activityName),
                  _scoreBoardPointText(
                      getScoreBoardPointText(
                          activity:
                              activitiesProvider.getActivity(activityName),
                          lookupValue: IScoreLookupValue.pos),
                      Colors.white),
                ],
              ),
      ),
    );
  }
}

enum IScoreLookupValue { pos, neg }

String getScoreBoardPointText(
    {required IScore? activity, required IScoreLookupValue lookupValue}) {
  String activityText = '';
  if (activity != null) {
    activityText = lookupValue == IScoreLookupValue.pos
        ? activity.pos.toString()
        : activity.neg.toString();
  }
  return activityText;
}
