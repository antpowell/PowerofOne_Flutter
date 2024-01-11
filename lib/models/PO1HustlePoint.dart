import 'PO1Level.dart';

enum EHustlePoint { STL, RB, AST, BLK, TO, PF }

extension Search on Iterable<EHustlePoint> {
  EHustlePoint find(value) {
    late EHustlePoint found;
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
  final Set<Map<PO1Levels, num>> great;
  final Set<Map<PO1Levels, num>> good;
  final Set<Map<PO1Levels, num>> average;
  final Set<Map<PO1FeedbackLevel, String>> feedback;
  PO1HustlePoint({
    required this.great,
    required this.good,
    required this.average,
    required this.feedback,
  });
}
