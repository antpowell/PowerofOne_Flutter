import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Score/cubit/activities_cubit.dart';
import '../../TrackerButton.dart';
import 'package:provider/provider.dart';

class PointsSection extends StatelessWidget {
  // _createSectionList() {
  //   _activities.points.forEach((element) {
  //     sectionList.add(TrackerButton(element));
  //   });
  //   return sectionList;
  // }

  @override
  Widget build(BuildContext context) {
    final Activities a = Provider.of<Activities>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        return TrackerButton(a.pointsMap.values.elementAt(index));
      },
      itemCount: a.pointsMap.length,
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
