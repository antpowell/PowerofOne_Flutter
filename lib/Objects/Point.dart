import 'package:flutter/widgets.dart';

import 'Score/Score.dart';

class Point extends IScore {
  Point(String title, [int pos = 0, int neg = 0]) : super(title, pos, neg);

  // @override
  // Point miss() {
  //   this.neg++;
  //   debugPrint('${this.title}: -${this.neg}');
  //   return this;
  // }

  // @override
  // Point undoMiss() {
  //   this.neg--;
  //   debugPrint('${this.title}: -${this.neg}');
  //   return this;
  // }
  @override
  String toString() {
    return 'made $pos, missed $neg';
  }
}
