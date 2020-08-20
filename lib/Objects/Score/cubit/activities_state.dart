part of 'activities_cubit.dart';

@immutable
abstract class ActivitiesState {
  final Activities activities = new Activities();
}

class ActivitiesInitial extends ActivitiesState {}

class MadeActivity extends ActivitiesState {
  final Score activity;
  MadeActivity(this.activity);
}

class MissedActivity extends ActivitiesState {
  final Score activity;
  MissedActivity(this.activity);
}
