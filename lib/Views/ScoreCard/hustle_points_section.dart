import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Objects/Activities.dart';

import '../../TrackerButton.dart';

class HustlePointsSection extends StatelessWidget {
  final List<Widget> sectionList = [];

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
    // final Activities a = Provider.of<Activities>(context);_pointButtons
    final Activities a = context.select((Activities a) => a);

    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      children: _createSectionList(a),
    );
  }
}
