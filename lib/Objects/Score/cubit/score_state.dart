// Implemented using [this](https://www.youtube.com/watch?v=y564ETOCog8) tutorial

part of 'score_cubit.dart';

@immutable
abstract class ScoreState {
  const ScoreState();
}

class ScoreInitial extends ScoreState {
  const ScoreInitial();
}

class ScoreMade extends ScoreState {
  const ScoreMade();
}

class ScoreMiss extends ScoreState {
  final Score activity;
  ScoreMiss(this.activity);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ScoreMiss && o.activity == activity;
  }

  @override
  int get hashCode => activity.hashCode;
}

class ScoreError extends ScoreState {
  final String errorMessage;
  const ScoreError(this.errorMessage) : super();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ScoreError && o.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}
