import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/models/PO1Grade.dart';
import 'package:power_one/models/User.dart';
import 'dart:developer' as dev;

import 'Score/Score.dart';

enum _powerOfOneGrades { A, B, C, D, F }
enum _playerLevel { elementry, middle, college, pro }

class PO1Score extends ChangeNotifier {
  static final int minimumThreshold = 5;
  static User _user;

  Queue<Map<String, IScore>> history = new Queue();

  LinkedHashMap<String, Point> _pointsMap = new LinkedHashMap();
  LinkedHashMap<String, Point> get pointsMap => _pointsMap;

  LinkedHashMap<String, Play> _hustlePointsMap = new LinkedHashMap();
  LinkedHashMap<String, Play> get hustlePointsMap => _hustlePointsMap;

  List<IScore> improvementAreas = [];

  PO1Score() {
    kLabels["points"].forEach((element) {
      _pointsMap[element] = new Point(element);
    });
    kLabels["hustle_points"].forEach((element) {
      _hustlePointsMap[element] = new Play(element);
    });
    debugPrint('IPoints created!');
  }

  assignUser(User user) {
    _user = user;
  }

  made(IScore activity) {
    Map<String, IScore> madeHistoryEvent;
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

  missed(IScore activity) {
    _pointsMap[activity.title] = activity.miss();
    history.addLast({"miss": _pointsMap[activity.title]});
    debugPrint('Action: $activity : neg-> ${activity.neg}');
    notifyListeners();
  }

  undo() {
    dev.log('History state', name: 'history', error: {'data': history});
    if (history.isNotEmpty) {
      Map<String, IScore> undoEvent = history.removeLast();
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

  IScore getActivity(String activityName) {
    return (_pointsMap.containsKey(activityName))
        ? _pointsMap[activityName]
        : _hustlePointsMap[activityName];
  }

  Set<LinkedHashMap<String, IScore>> returnPowerOfOneCollectionSet() {
    return {_hustlePointsMap, _pointsMap};
  }

  int getTotalPointsScored() {
    int totalPointsScored = 0;
    _pointsMap.forEach((key, value) {
      switch (key) {
        case '1PT':
          totalPointsScored += value.total();
          break;
        case '2PTs':
          totalPointsScored += (value.total() * 2);
          break;
        case '3PTs':
          totalPointsScored += (value.total() * 3);
          break;
      }
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
    _hustlePointsMap.forEach((key, value) {
      if (key == 'TO') {
        powerOfOneScore -= value.total();
      } else {
        powerOfOneScore += value.total();
      }
      if (value.total() < 0) {
        improvementAreas.add(value);
      }
    });
    dev.log('PO1 Score: --> $powerOfOneScore');
    return powerOfOneScore;
  }

  String powerOfOneGrade() {
    return metPlaytimeThreshold()
        ? PO1Grade().CalculateGrade(_getPowerOfOneScore())
        : 'NA';
  }

  bool metPlaytimeThreshold() {
    if (history.length >= minimumThreshold) {
      return true;
    }

    return false;
  }
}
