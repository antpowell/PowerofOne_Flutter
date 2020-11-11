import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/PO1Score.dart';

import 'User.dart';

class PO1Grade {
  final int pO1Score;

  PO1Grade(this.pO1Score);

  CalculateGrade() {
    return (pO1Score > 8)
        ? GRADE.A
        : (pO1Score > 6)
            ? GRADE.B
            : (pO1Score > 4)
                ? GRADE.C
                : (pO1Score > 2)
                    ? GRADE.D
                    : GRADE.F;
  }
}
