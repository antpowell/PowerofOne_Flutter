import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Objects/Activities.dart';

import '../../TrackerButton.dart';

class HustlePointsSection extends StatelessWidget {
  List<Widget> sectionList = [];

  _createSectionList(Activities activities) {
    activities.hustlePointsMap.values.forEach(
      (element) {
        sectionList.add(TrackerButton(element));
      },
    );
    return sectionList;
  }

  @override
  Widget build(BuildContext context) {
    final Activities a = Provider.of<Activities>(context);

    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     return TrackerButton(Activities().plays[index]);
    //   },
    //   itemCount: Activities().plays.length,
    // );

    return Container(
      child: Wrap(
        direction: Axis.vertical,
        children: _createSectionList(a),
      ),
    );
  }
}
