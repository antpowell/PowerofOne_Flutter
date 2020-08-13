import 'package:flutter/material.dart';
import 'package:power_one/Objects/Command.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';

import 'Made.dart';
import 'Miss.dart';

class Activities {
  static final Activities _singleton = Activities._initializer();
  List<Command> history = [];

  Point freeThrow = new Point("freeThrow");
  Point twoPoint = new Point("twoPoint");
  Point threePoint = new Point("threePoint");
  Point turnOver = new Point("turnOver");

  Play assist = new Play("ssist");
  Play offRebound = new Play("ffRebound");
  Play steal = new Play("teal");
  Play block = new Play("lock");

  List<Point> _points = [];
  List<Point> get points => _points;

  List<Play> _plays = [];
  List<Play> get plays => _plays;

  Made made;
  Miss miss;

  factory Activities() {
    return _singleton;
  }

  Activities._initializer() {
    _points.add(freeThrow);
    _points.add(twoPoint);
    _points.add(threePoint);
    _points.add(turnOver);

    _plays.add(assist);
    _plays.add(offRebound);
    _plays.add(steal);
    _plays.add(block);
    debugPrint('IPoints created!');
  }

  // TODO: make this class a singleton
  Activities get instance => this;
  // set instance() =>
}
