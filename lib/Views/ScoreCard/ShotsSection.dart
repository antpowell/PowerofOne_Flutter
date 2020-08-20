import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Score/cubit/activities_cubit.dart';
import '../../TrackerButton.dart';

class ShotsSection extends StatelessWidget {
  List<Widget> sectionList = [];
  // Activities _activities = new Activities();

  _createSectionList(Activities activities) {
    activities.points.forEach((element) {
      sectionList.add(TrackerButton(element));
    });
    return sectionList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivitiesCubit, ActivitiesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox.expand(
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            direction: Axis.vertical,
            children: _createSectionList(state.activities),
          ),
        );
      },
    );
  }
}
