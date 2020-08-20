import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Objects/Score/Score.dart';
import 'package:power_one/Objects/Score/cubit/score_cubit.dart';

class ScoreBoardPointsDisplayNotifier extends StatelessWidget {
  const ScoreBoardPointsDisplayNotifier({Key key, this.activity})
      : super(key: key);
  final Score activity;

  Text _scoreBoardText(label) {
    return Text(
      label,
      style: kLabelTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => ScoreCubit(activity),
        child: BlocConsumer<ScoreCubit, ScoreState>(
          listener: (context, state) {
            if (state is ScoreMade) {
              debugPrint('Listener ScoreMade Fired');
              buildScoreDisplay(state.activity);
            }
          },
          builder: (context, state) {
            if (state is ScoreMade) {
              debugPrint('Builder ScoreMade Fired');
              return buildScoreDisplay(state.activity);
            } else if (state is ScoreMiss) {
              debugPrint('Builder ScoreMissed Fired');
              return buildScoreDisplay(state.activity);
            }
          },
        ),
      ),
    );
  }

  Column buildScoreDisplay(Score activity) {
    return Column(
      children: [
        _scoreBoardText(activity.title),
        Container(
          child: (activity is Point)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _scoreBoardText('${activity.pos}'),
                    _scoreBoardText('${activity.neg}'),
                  ],
                )
              : _scoreBoardText('${activity.pos}'),
        ),
      ],
    );
  }

  // Provider myProvider() {}
}
