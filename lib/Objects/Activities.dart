import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/models/User.dart';
import 'dart:developer' as dev;

import 'Score/Score.dart';

enum _powerOfOneGrades { A, B, C, D, F }

class Activities extends ChangeNotifier {
  // static final Activities _singleton = Activities._initializer();

  Queue<Map<String, Score>> history = new Queue();

  LinkedHashMap<String, Point> _pointsMap = new LinkedHashMap();
  LinkedHashMap<String, Point> get pointsMap => _pointsMap;

  LinkedHashMap<String, Play> _hustlePointsMap = new LinkedHashMap();
  LinkedHashMap<String, Play> get hustlePointsMap => _hustlePointsMap;

  List<Score> improvementAreas = [];
  User user;

  Activities() {
    kLabels["points"].forEach((element) {
      _pointsMap[element] = new Point(element);
    });
    kLabels["hustle_points"].forEach((element) {
      _hustlePointsMap[element] = new Play(element);
    });
    debugPrint('IPoints created!');
  }

  assignUser(User user) {
    this.user = user;
  }

  made(Score activity) {
    Map<String, Score> madeHistoryEvent;
    if (_hustlePointsMap.containsValue(activity)) {
      _hustlePointsMap[activity.title] = activity.make();
      madeHistoryEvent = {"made": _hustlePointsMap[activity.title]};
    } else {
      _pointsMap[activity.title] = activity.make();
      madeHistoryEvent = {"made": _pointsMap[activity.title]};
    }

    debugPrint('Action: $activity : pos-> ${activity.pos}');
    history.addLast(madeHistoryEvent);
    notifyListeners();
  }

  missed(Score activity) {
    _pointsMap[activity.title] = activity.miss();
    history.addLast({"miss": _pointsMap[activity.title]});
    debugPrint('Action: $activity : neg-> ${activity.neg}');
    notifyListeners();
  }

  undo() {
    dev.log('History state', name: 'history', error: {'data': history});
    if (history.isNotEmpty) {
      Map<String, Score> undoEvent = history.removeLast();
      (undoEvent.keys.first == "made")
          ? (_hustlePointsMap.containsValue(undoEvent.values.first))
              ? _hustlePointsMap[undoEvent.values.first.title] =
                  undoEvent.values.first.undoMake()
              : _pointsMap[undoEvent.values.first.title] =
                  undoEvent.values.first.undoMake()
          : _pointsMap[undoEvent.values.first.title] =
              undoEvent.values.first.undoMiss();
    } else {
      dev.log("Empty history list",
          name: 'Empty history list',
          error: {'data': 'Event history is empty, no prior events'});
    }
    notifyListeners();
  }

  Score getActivity(String activityName) {
    return (_pointsMap.containsKey(activityName))
        ? _pointsMap[activityName]
        : _hustlePointsMap[activityName];
  }

  Set<LinkedHashMap<String, Score>> returnPowerOfOneCollectionSet() {
    return {_hustlePointsMap, _pointsMap};
  }

  int getTotalPointsScored() {
    int totalPointsScored = 0;
    _pointsMap.forEach((key, value) {
      totalPointsScored += value.total();
    });
    return totalPointsScored;
  }

  int _getPowerOfOneScore() {
    int powerOfOneScore = 0;

    _pointsMap.forEach((key, value) {
      powerOfOneScore += value.total();
      if (value.total() < 0) {
        improvementAreas.add(value);
      }
    });

    return powerOfOneScore;
  }

  String powerOfOneGrade() {
    final int powerOfOneScore = _getPowerOfOneScore();
    return metPlaytimeThreshold()
        ? powerOfOneScore > 8
            ? "A"
            : (powerOfOneScore > 6
                ? "B"
                : (powerOfOneScore > 4
                    ? "C"
                    : (powerOfOneScore > 2 ? "D" : "F")))
        : "NA";
  }

  bool metPlaytimeThreshold() {
    if (history.length > 2) {
      return true;
    }

    return false;
  }
}
