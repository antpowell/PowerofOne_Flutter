import 'package:flutter/widgets.dart';

import 'Score/Score.dart';

class Point extends Score {
  Point(String title, [int pos = 0, int neg = 0]) : super(title, pos, neg);

  // @override
  // Point miss() {
  //   int newNeg = neg+1;
  //   this = new Point(title, pos, newNeg);
  //   debugPrint('${this.title}: -${this.neg}');
  //   return this;
  // }

  // @override
  // Point undoMiss() {
  //   --neg;
  //   debugPrint('${this.title}: -${this.neg}');
  //   return this;
  // }
}
