// Implemented using [this](https://www.youtube.com/watch?v=y564ETOCog8) tutorial

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Objects/Score/Score.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  Score _score;

  ScoreCubit(this._score) : super(ScoreInitial());

  void make() {
    int newPos = _score.pos + 1;

    (_score is Point)
        ? Activities().pointsMap[_score.title] =
            new Point(_score.title, newPos, _score.neg)
        : Activities().playsMap[_score.title] = new Play(_score.title, newPos);

    emit(ScoreMade());
  }

  void miss() {
    int newNeg = _score.neg + 1;
    Activities().pointsMap[_score.title] =
        new Point(_score.title, _score.pos, newNeg);
    emit(ScoreMiss(new Point(_score.title, _score.pos, newNeg)));
  }

  // @override
  // void onChange(Change<ScoreState> change) {
  //   debugPrint("Score Cubit changed: $change");
  //   debugPrint(
  //       "Score Cubit changed: ${change.currentState.activity.title}: ${change.currentState.activity.pos}:=> ${change.nextState.activity.pos}");
  //   super.onChange(change);
  // }
}
