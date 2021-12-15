import 'package:power_one/Data/constants.dart';
import 'package:power_one/Models/PO1Level.dart';
import 'package:power_one/Models/PO1User.dart';

class PO1Grade {
  static final Map<String, Set<Map<PO1Levels, num>>> grade = {
    'A': {
      {PO1Levels.PRO: 17},
      {PO1Levels.COLHIGH: 9},
      {PO1Levels.GRADE: 5},
    },
    'B': {
      {PO1Levels.PRO: 13},
      {PO1Levels.COLHIGH: 7},
      {PO1Levels.GRADE: 4},
    },
    'C': {
      {PO1Levels.PRO: 9},
      {PO1Levels.COLHIGH: 5},
      {PO1Levels.GRADE: 3},
    },
    'D': {
      {PO1Levels.PRO: 5},
      {PO1Levels.COLHIGH: 3},
      {PO1Levels.GRADE: 2},
    },
    'F': {
      {PO1Levels.PRO: 1},
      {PO1Levels.COLHIGH: 1},
      {PO1Levels.GRADE: 1},
    },
  };

  static gradeConverterByPlayerLevel() {
    return {
      'A': grade['A']
          .where((element) => element.containsKey(PO1User().playerLevel))
          .first[PO1User().playerLevel],
      'B': grade['B']
          .where((element) => element.containsKey(PO1User().playerLevel))
          .first[PO1User().playerLevel],
      'C': grade['C']
          .where((element) => element.containsKey(PO1User().playerLevel))
          .first[PO1User().playerLevel],
      'D': grade['D']
          .where((element) => element.containsKey(PO1User().playerLevel))
          .first[PO1User().playerLevel],
      'F': grade['F']
          .where((element) => element.containsKey(PO1User().playerLevel))
          .first[PO1User().playerLevel],
    };
  }

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
    PO1User _user = PO1User();

    return (pO1Score >= gradeConverterByPlayerLevel()['A'])
        ? 'A'
        : (pO1Score >= gradeConverterByPlayerLevel()['B'])
            ? 'B'
            : (pO1Score >= gradeConverterByPlayerLevel()['C'])
                ? 'C'
                : (pO1Score > gradeConverterByPlayerLevel()['D'])
                    ? 'D'
                    : 'F';
  }
}
