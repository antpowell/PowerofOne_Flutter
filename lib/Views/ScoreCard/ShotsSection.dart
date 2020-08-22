import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Score/cubit/activities_cubit.dart';
import '../../TrackerButton.dart';

class ShotsSection extends StatelessWidget {
  List<Widget> sectionList = [];
  Activities _activities = new Activities();

  _createSectionList() {
    _activities.points.forEach((element) {
      sectionList.add(TrackerButton(element));
    });
    return sectionList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TrackerButton(Activities().points[index]);
      },
      itemCount: Activities().points.length,
      physics: NeverScrollableScrollPhysics(),
    );

    // return SizedBox.expand(
    //   child: Wrap(
    //     alignment: WrapAlignment.spaceEvenly,
    //     direction: Axis.vertical,
    //     children: _createSectionList(),
    //   ),
    // );
  }
}
