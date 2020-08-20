import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:power_one/Objects/Activities.dart';

import '../Score.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit() : super(ActivitiesInitial());

  void activityUpdated() {
    emit(state);
  }

  void activityMade(Score activity) {
    emit(MadeActivity(activity));
  }

  void activityMissed(Score activity) {
    emit(MissedActivity(activity));
  }
}
