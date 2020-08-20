import 'package:bloc/bloc.dart';
import 'package:power_one/Objects/Score/Score.dart';

import 'ScoreState.dart';

class ScoreCubit extends Cubit<ScoreState> {
  final Score _score;
  ScoreCubit(this._score) : super(ScoreState(0, 0));

  void changeState() {
    // emit(ScoreState())
  }
}
