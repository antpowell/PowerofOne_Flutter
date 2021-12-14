import 'package:power_one/Models/PO1User.dart';

const scoreing = {
  'amature': {'A': 9, 'B': 7, 'C': 5, 'D': 3},
  'pro': {'A': 13, 'B': 10, 'C': 5, 'D': 3},
};

String powerOfOneScoreCalculator(num _po1Score, PO1User user) {
  // String byLevel = (user.level == kPlayserCategory.amature)? : ;
  String eanrdPO1Score = (_po1Score >= 9)
      ? 'A'
      : (_po1Score >= 7)
          ? 'B'
          : (_po1Score >= 5)
              ? 'C'
              : (_po1Score >= 3)
                  ? 'D'
                  : 'F';
  // return (_po1Score >= 13) ? 'A' :(_po1Score>=10)? 'B': (_po1Score>=7)? 'C':(_po1Score>=4)? 'D':'F';
  return eanrdPO1Score;
}

// Pro:
// 13+ = A
// 10-12 = B
// 7-9 = C
// 4-6 = D
// 1-3 = F

// (High School/College)Amateur:
// 9+ = A
// 7-8 = B
// 5-6 = C
// 3-4 = D
// 1-2 = F

// Middle School

// Elementary
