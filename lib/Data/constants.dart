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
    'STL',
    'ORB',
    'AST',
    'BLK',
    'TO',
  ],
};

const kStandards = {
  'hustle_points': {
    'STL': {'great': 2, 'poor': 0},
    'ORB': {'great': 3, 'poor': 1},
    'AST': {'great': 2, 'poor': 0},
    'BLK': {'great': 2, 'poor': 0},
    'TO': {'great': 2, 'poor': 0},
  },
  'points': {
    '1PT': {'adverage': 70, 'poor': 50},
    '2PTs': {'adverage': 1, 'great': 2, 'poor': 0},
    '3PTs': {'adverage': 1, 'great': 2, 'poor': 0},
    'FG': {'adverage': 40, 'poor': 30}
  }
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

enum kPlayerLevel { elementry, middle, high, college, pro }
enum kPlayerCategory { amature, pro }
enum GRADE { A, B, C, D, F, NA }
