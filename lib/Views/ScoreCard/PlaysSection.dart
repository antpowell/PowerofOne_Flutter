import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Objects/Activities.dart';

import '../../TrackerButton.dart';

class PlaysSection extends StatelessWidget {
  List<Widget> sectionList = [];

  _createPlaysButtonFrom() {}

  _createSectionList() {
    kLabels["plays"].forEach((element) {
      String name = element.toString();
      Play play = new Play(element.toString());
      sectionList.add(TrackerButton(play));
    });
    return sectionList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        direction: Axis.vertical,
        children: _createSectionList(),
      ),
    );
  }
}
