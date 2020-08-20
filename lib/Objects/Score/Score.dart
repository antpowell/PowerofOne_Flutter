import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class Score {
  final int pos;

  final int neg;

  final String _title;
  String get title => _title;

  Score(this._title, this.pos, this.neg);

  // make() {
  //   // _pos++;
  //   debugPrint('${this.title}: ${this.pos}');
  //   return this;
  // }

  // undoMake() {
  //   // _pos--;
  //   debugPrint('${this.title}: ${this.pos}');
  //   return this;
  // }

  // miss() {}

  // undoMiss() {}

  int total() {
    return pos - neg;
  }
}
