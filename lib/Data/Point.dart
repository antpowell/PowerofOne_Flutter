import 'package:flutter/material.dart';

class Point {
  String _label;
  int _made = 0;
  int _missed = 0;
  int _total = 0;
  bool _dual = false;
  List<Widget> buttonGroup = [];

  Point(String label, bool dual) {
    this._label = label;
    this._dual = dual;
  }

  void made() {
    _made++;
    _calcTotal();
  }

  void missed() {
    if (_dual) {
      _missed++;
      _calcTotal();
    }
  }

  void _calcTotal() {
    _total = _made - _missed;
    if (_total < 0) {
      _total = 0;
    }
  }

  String getLabel() {
    return _label;
  }

  int getTotal() {
    return _total;
  }

  int getMade() {
    return _made;
  }

  int getMissed() {
    return _dual ? _total : null;
  }

  bool hasDual() {
    return _dual;
  }
}
