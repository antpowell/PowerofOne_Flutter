import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:power_one/Objects/Point.dart';

abstract class Score {
  int _pos;
  int get pos => _pos;

  int _neg;
  int get neg => _neg;

  final String _title;
  String get title => _title;

  Score(this._title, this._pos, this._neg);

  make() {
    _pos++;
    debugPrint('${this.title}: ${this.pos}');
    return this;
  }

  undoMake() {
    _pos--;
    debugPrint('${this.title}: ${this.pos}');
    return this;
  }

  miss() {
    (this is Point)
        ? _neg++
        : debugPrint("Only Points have can call the miss function.");
  }

  undoMiss() {
    (this is Point)
        ? _neg--
        : debugPrint("Only Points have can call the miss function.");
  }

  int total() {
    return pos - neg;
  }
}
