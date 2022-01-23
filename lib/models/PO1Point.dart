import 'PO1Level.dart';

enum EPoint { ONE, TWO, THREE }

extension EPointByName on EPoint {
  String get translatedName {
    var give;
    switch (this) {
      case EPoint.ONE:
        give = '1PT';
        break;
      case EPoint.TWO:
        give = '2PTs';
        break;
      case EPoint.THREE:
        give = '3PTs';
        break;
    }
    return give;
  }
}

extension Search on Iterable<EPoint> {
  EPoint find(value) {
    EPoint found;
    switch (value) {
      case '1PT':
        found = EPoint.ONE;
        break;
      case '2PTs':
        found = EPoint.TWO;
        break;
      case '3PTs':
        found = EPoint.THREE;
        break;
    }
    return found;
  }
}

class PO1Point {
  Set<Map<PO1Levels, num>> great, good, average;
  Set<Map<PO1Levels, num>> _great, _good, _average;
  Set<Map<PO1FeedbackLevel, String>> _feedback;
  Set<Map<PO1FeedbackLevel, String>> feedback;
  PO1Point({
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
