import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Objects/PO1Score.dart';

import '../../TrackerButton.dart';

class HustlePointsSection extends StatelessWidget {
  final List<Widget> sectionList = [];

  _createSectionList(PO1Score activities) {
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
    final PO1Score a = context.select((PO1Score a) => a);

    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 12,
      runSpacing: 10,
      direction: Axis.horizontal,
      children: _createSectionList(a),
    );
  }
}
