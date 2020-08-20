import 'dart:async';

import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Command.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Objects/Score/cubit/activities_cubit.dart';

import 'Made.dart';
import 'Miss.dart';
import 'Score/Score.dart';

class Activities {
  static final Activities _singleton = Activities._initializer();

  List<Command> history = [];

  Map<String, Point> _pointsMap = {};
  Map<String, Point> get pointsMap => _pointsMap;

  Map<String, Play> _playsMap = {};
  Map<String, Play> get playsMap => _playsMap;

  List<Point> _points = [];
  List<Point> get points => _points;

  List<Play> _plays = [];
  List<Play> get plays => _plays;

  factory Activities() {
    return _singleton;
  }

  Activities._initializer() {
    kLabels["points"].forEach((element) {
      _points.add(new Point(element));
      _pointsMap[element] = new Point(element);
    });
    kLabels["plays"].forEach((element) {
      _plays.add(new Play(element));
      _playsMap[element] = new Play(element);
    });
    debugPrint('IPoints created!');
  }

  // TODO: make this class a singleton
  Activities get instance => this;
  // set instance() =>
}
