import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Point.dart';

class ScoreBoardPointsDisplay extends StatelessWidget {
  final String activityName;
  ScoreBoardPointsDisplay(this.activityName);

  Text _scoreBoardText(label) {
    return Text(
      label,
      style: kLabelTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _scoreBoardText(activityName),
        Consumer<Activities>(
          builder: (context, activitiesProvider, child) => Container(
            child: (activitiesProvider.getActivity(activityName) is Point)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: _scoreBoardText(activitiesProvider
                            .getActivity(activityName)
                            .pos
                            .toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: _scoreBoardText(activitiesProvider
                            .getActivity(activityName)
                            .neg
                            .toString()),
                      ),
                    ],
                  )
                : _scoreBoardText(activitiesProvider
                    .getActivity(activityName)
                    .pos
                    .toString()),
          ),
        ),
      ],
    );
  }

  // Column buildScoreDisplay(Score activity) {
  //   return Column(
  //     children: [
  //       _scoreBoardText(activity.title),
  //       Container(
  //         child: (activity is Point)
  //             ? Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   _scoreBoardText('${activity.pos}'),
  //                   _scoreBoardText('${activity.neg}'),
  //                 ],
  //               )
  //             : _scoreBoardText('${activity.pos}'),
  //       ),
  //     ],
  //   );
}
