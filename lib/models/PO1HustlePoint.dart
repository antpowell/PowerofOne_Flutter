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
  PO1HustlePoint({
    required Set<Map<PO1Levels, num>> great,
    required Set<Map<PO1Levels, num>> good,
    required Set<Map<PO1Levels, num>> average,
    required Set<Map<PO1FeedbackLevel, String>> feedback,
  });
  Set<Map<PO1Levels, num>> get great => great;
  Set<Map<PO1Levels, num>> get good => good;
  Set<Map<PO1Levels, num>> get average => average;
  Set<Map<PO1FeedbackLevel, String>> get feedback => feedback;
}
