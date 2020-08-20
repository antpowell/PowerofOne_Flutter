import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Objects/Score/cubit/activities_cubit.dart';
import 'package:power_one/Objects/Score/cubit/score_cubit.dart';
import './Objects/Play.dart';
import './Objects/Point.dart';
import 'Objects/Score/Score.dart';

class TrackerButton extends StatelessWidget {
  final Score activity;
  TrackerButton(this.activity);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivitiesCubit, ActivitiesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ScoreCubit(activity),
          child: BlocConsumer<ScoreCubit, ScoreState>(
            listener: (context, state) {},
            builder: (context, state) {
              return pointOrPlayTrackerBuilder(context, state);
            },
          ),
        );
      },
    );
  }

  Widget pointOrPlayTrackerBuilder(BuildContext context, ScoreState state) {
    final scoreCubit = context.bloc<ScoreCubit>();

    return (activity is Point)
        ? Row(
            children: [
              buildTrackerButton(
                Icon(Icons.check),
                Colors.green,
                scoreCubit.make,
              ),
              buildTrackerButton(
                Icon(Icons.clear),
                Colors.red,
                scoreCubit.miss,
              ),
            ],
          )
        : buildTrackerButton(
            Text(activity.title),
            Colors.green,
            scoreCubit.make,
          );
  }

  Container buildTrackerButton(Widget w, Color c, Function f) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 80,
          height: 80,
          child: OutlineButton(
            shape: CircleBorder(),
            child: w,
            textColor: c,
            highlightedBorderColor: c,
            borderSide: BorderSide(width: 2, color: c),
            onPressed: () {
              f();
            },
          ),
        ),
      ),
    );
  }
}
