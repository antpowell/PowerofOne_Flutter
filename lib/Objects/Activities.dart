import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Command.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';

import 'Score/Score.dart';

class Activities extends ChangeNotifier {
  // static final Activities _singleton = Activities._initializer();

  List<Command> history = [];

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
    (_hustlePointsMap.containsValue(activity))
        ? _hustlePointsMap[activity.title] = activity.make()
        : _pointsMap[activity.title] = activity.make();
    debugPrint('Action: $activity : pos-> ${activity.pos}');
    notifyListeners();
  }

  missed(Score activity) {
    _pointsMap[activity.title] = activity.miss();
    debugPrint('Action: $activity : neg-> ${activity.neg}');
    notifyListeners();
  }

  Score getActivity(String activtyName) {
    return (_pointsMap.containsKey(activtyName))
        ? _pointsMap[activtyName]
        : _hustlePointsMap[activtyName];
  }
}
