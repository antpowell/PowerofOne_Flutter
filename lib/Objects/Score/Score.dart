import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:power_one/Objects/Point.dart';

abstract class IScore {
  int _pos;
  int get pos => _pos;

  int _neg;
  int get neg => _neg;

  final String _title;
  String get title => _title;

  IScore(this._title, this._pos, this._neg);

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
    if (this is Point) {
      _neg++;
      return this;
    }
    debugPrint("Only Points have can call the miss function.");
  }

  undoMiss() {
    if (this is Point) {
      _neg--;
      return this;
    }
    debugPrint("Only Points have can call the miss function.");
  }

  int total() {
    return pos - neg;
  }

  double avg() {
    return (pos + neg) != 0 ? ((pos / (pos + neg)) * 100).roundToDouble() : 0;
  }
}
