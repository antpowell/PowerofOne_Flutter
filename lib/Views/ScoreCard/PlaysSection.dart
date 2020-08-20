import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Score/cubit/activities_cubit.dart';

import '../../TrackerButton.dart';

class PlaysSection extends StatelessWidget {
  List<Widget> sectionList = [];
  Activities _activities = new Activities();

  _createSectionList() {
    _activities.plays.forEach((element) {
      sectionList.add(TrackerButton(element));
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
