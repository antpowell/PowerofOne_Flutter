import 'dart:ui';

import 'package:flutter/material.dart';

const kTheme = {};

const kLabels = {
  'points': [
    '1PT',
    '2PTs',
    '3PTs',
  ],
  'hustle_points': [
    'STLS',
    'ORB',
    'ASST',
    'BLKS',
    'TO',
  ],
};

const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.white,
);

const TextStyle kScoreBoardLabelsTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);
const TextStyle kScoreBoardPointsTextStyle = TextStyle(
  fontSize: 42,
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

enum kPlayerLevel { elementry, middle, high, college, pro }
enum kPlayerCategory { amature, pro }
enum GRADE { A, B, C, D, F, NA }
