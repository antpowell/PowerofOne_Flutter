import 'package:flutter/foundation.dart';

import 'PO1Level.dart';

enum EHustlePoint { STL, RB, AST, BLK, TO, PF }

extension Search on Iterable<EHustlePoint> {
  EHustlePoint find(value) {
    EHustlePoint found;
    switch (value) {
      case 'STL':
        found = EHustlePoint.STL;
        break;
      case 'RB':
        found = EHustlePoint.RB;
        break;
      case 'AST':
        found = EHustlePoint.AST;
        break;
      case 'BLK':
        found = EHustlePoint.BLK;
        break;
      case 'TO':
        found = EHustlePoint.TO;
        break;
      case 'PF':
        found = EHustlePoint.PF;
        break;
      default:
    }
    return found;
  }
}

class PO1HustlePoint {
  Set<Map<PO1Levels, num>> great, good, average;
  Set<Map<PO1Levels, num>> _great, _good, _average;
  Set<Map<PO1FeedbackLevel, String>> _feedback;
  Set<Map<PO1FeedbackLevel, String>> feedback;
  PO1HustlePoint({
    Set<Map<PO1Levels, num>> great,
    Set<Map<PO1Levels, num>> good,
    Set<Map<PO1Levels, num>> average,
    Set<Map<PO1FeedbackLevel, String>> feedback,
  }) {
    _great = great;
    _good = good;
    _average = average;
    _feedback = feedback;
    this.great = _great;
    this.good = _good;
    this.average = _average;
    this.feedback = _feedback;
  }
}
