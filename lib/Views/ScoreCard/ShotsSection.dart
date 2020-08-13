import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Objects/Activities.dart';

import '../../TrackerButton.dart';

class ShotsSection extends StatelessWidget {
  List<Widget> sectionList = [];

  _createSectionList() {
    kLabels["points"].forEach((element) {
      String name = element.toString();
      Point point = new Point(element.toString());
      sectionList.add(TrackerButton(point));
    });
    return sectionList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        direction: Axis.vertical,
        children: _createSectionList(),
      ),
    );
  }
}
