import 'package:power_one/Data/constants.dart';

class PO1Grade {
  calculateGradeEnum(int pO1Score) {
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

  static String calculateGrade(int pO1Score) {
    return (pO1Score > 8)
        ? 'A'
        : (pO1Score > 6)
            ? 'B'
            : (pO1Score > 4)
                ? 'C'
                : (pO1Score > 2)
                    ? 'D'
                    : 'F';
  }
}
