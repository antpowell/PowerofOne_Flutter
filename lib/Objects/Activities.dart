import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'dart:developer' as dev;

import 'Score/Score.dart';

class Activities extends ChangeNotifier {
  // static final Activities _singleton = Activities._initializer();

  Queue<Map<String, Score>> history = new Queue();

  LinkedHashMap<String, Point> _pointsMap = new LinkedHashMap();
  LinkedHashMap<String, Point> get pointsMap => _pointsMap;

  LinkedHashMap<String, Play> _hustlePointsMap = new LinkedHashMap();
  LinkedHashMap<String, Play> get hustlePointsMap => _hustlePointsMap;

  List<Point> _points = [];
  List<Point> get points => _points;

  List<Play> _hustlePoints = [];
  List<Play> get hustlePoints => _hustlePoints;

  Activities() {
    kLabels["points"].forEach((element) {
      _points.add(new Point(element));
      _pointsMap[element] = new Point(element);
    });
    kLabels["hustle_points"].forEach((element) {
      _hustlePoints.add(new Play(element));
      _hustlePointsMap[element] = new Play(element);
    });
    debugPrint('IPoints created!');
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

  Score getActivity(String activtyName) {
    return (_pointsMap.containsKey(activtyName))
        ? _pointsMap[activtyName]
        : _hustlePointsMap[activtyName];
  }

  // Score scoreHistory() {
  //   // TODO 1: push Score + action onto a stack;
  //   // https://github.com/szabgab/slides/blob/main/dart/examples/dart-intro/stack.dart
  //   // TODO 2: upon undo pop Score off stack with opp action;
  //   return null;
  // }
}
