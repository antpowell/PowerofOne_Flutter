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
    // a.hustlePointsMap.forEach((key, value) {
    //   _singleScoreSection.add(ScoreBoardPointsDisplay(key));
    // });

    return _singleScoreSection;
  }

  @override
  Widget build(BuildContext context) {
    final Activities activities =
        Provider.of<Activities>(context, listen: false);

    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            'Player Name',
            style: TextStyle(fontSize: 42, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 4,
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
        Expanded(
          flex: 2,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8,
            children: _createSignleScoreSectionLists(activities),
          ),
        ),

        // ListView.builder(
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) {
        //     ScoreBoardPointsDisplay(Activities().points[index]);
        //   },
        //   itemCount: Activities().points.length,
        // ),
        // Column(children: _createDualScoreSectionLists()),
      ],
    );

    // SizedBox.expand(
    //   child: Wrap(
    //     alignment: WrapAlignment.spaceEvenly,
    //     direction: Axis.horizontal,
    //     children: <Widget>[
    //       Text(
    //         'Player Name',
    //         style: TextStyle(fontSize: 42, color: Colors.white),
    //         textAlign: TextAlign.center,
    //       ),
    //       // ListView.builder(
    //       //   shrinkWrap: true,
    //       //   itemBuilder: (context, index) {
    //       //     ScoreBoardPointsDisplay(Activities().points[index]);
    //       //   },
    //       //   itemCount: Activities().points.length,
    //       // ),
    //       // Column(children: _createDualScoreSectionLists()),
    //       Wrap(
    //         spacing: 8.0,
    //         runSpacing: 8,
    //         children: _createSignleScoreSectionLists(),
    //       )
    //     ],
    //   ),
    // );
  }
}
