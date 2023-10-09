import 'package:flutter/material.dart';

const kTheme = {};

const kLabels = {
  'points': [
    '1PT',
    '2PTs',
    '3PTs',
  ],
  'hustle_points': [
    'STL',
    'RB',
    'AST',
    'BLK',
    'TO',
    'PF',
  ],
};

enum SummerizedPoint { FG, FT }

List<String> IndividualPoint = ['1PT', '2PTs', '3PTs'];

const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.white,
);

const TextStyle kScoreBoardLabelsTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);
const TextStyle kScoreBoardPointsTextStyle = TextStyle(
  fontSize: 36,
  color: Colors.white,
);

const TextStyle kNumberTextStyle = TextStyle(
  fontSize: 32,
  color: Colors.white,
);

TextStyle fScoreBoardLabelsTextStyle(Color fontColor) {
  return TextStyle(
    fontSize: 16,
    color: fontColor,
  );
}

TextStyle fScoreBoardPointsTextStyle(Color fontColor) {
  return TextStyle(
    fontSize: 42,
    color: fontColor,
  );
}

const formInputStyle = TextStyle(fontSize: 16, color: Colors.white);

enum kPlayerLevel { elementary, middle, high, college, pro }

extension ParseToString on kPlayerLevel {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

enum GRADE { A, B, C, D, F, NA }
