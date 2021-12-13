import 'PO1Level.dart';

class PO1Point {
  Set<Map<PO1Levels, num>> great, good, average;
  Set<Map<PO1Levels, num>> _great, _good, _average;
  PO1Point({
    Set<Map<PO1Levels, num>> great,
    Set<Map<PO1Levels, num>> good,
    Set<Map<PO1Levels, num>> average,
  }) {
    _great = great;
    _good = good;
    _average = average;
    this.great = great;
    this.good = good;
    this.average = average;
  }
}
