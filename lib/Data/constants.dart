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
    'RB',
    'AST',
    'BLK',
    'TO',
    'PF',
  ],
};

const Map<String, dynamic> kStandards = {
  'hustle_points': {
    kPlayerCategory.PRO: {
      'STL': {'great': 2, 'poor': 0},
      'OR': {'great': 9, 'good': 7, 'average': 5},
      'AST': {'great': 2, 'poor': 0},
      'BLK': {'great': 2, 'poor': 0},
      'TO': {'great': 2, 'poor': 0},
      'PF': 0,
    },
    kPlayerCategory.HIGHANDCOLLEGE: {
      'STL': {'great': 2, 'poor': 0},
      'OR': {'great': 8, 'good': 6, 'average': 4},
      'AST': {'great': 2, 'poor': 0},
      'BLK': {'great': 2, 'poor': 0},
      'TO': {'great': 2, 'poor': 0},
      'PF': 0,
    },
    kPlayerCategory.GRADESCHOOL: {
      'STL': {'great': 2, 'poor': 0},
      'OR': {'great': 7, 'good': 5, 'average': 3},
      'AST': {'great': 2, 'poor': 0},
      'BLK': {'great': 2, 'poor': 0},
      'TO': {'great': 2, 'poor': 0},
      'PF': 0,
    },
  },
  'points': {
    kPlayerCategory.PRO: {
      '1PT': {'great': 70, 'average': 50},
      // '2PTs': {'adverage': 1, 'great': 2, 'poor': 0},
      // '3PTs': {'adverage': 1, 'great': 2, 'poor': 0},
      'FG': {'great': 40, 'average': 30}
    },
    kPlayerCategory.HIGHANDCOLLEGE: {
      '1PT': {'great': 70, 'average': 50},
      // '2PTs': {'adverage': 1, 'great': 2, 'poor': 0},
      // '3PTs': {'adverage': 1, 'great': 2, 'poor': 0},
      'FG': {'great': 40, 'average': 30}
    },
    kPlayerCategory.GRADESCHOOL: {
      '1PT': {'great': 70, 'average': 50},
      // '2PTs': {'adverage': 1, 'great': 2, 'poor': 0},
      // '3PTs': {'adverage': 1, 'great': 2, 'poor': 0},
      'FG': {'great': 40, 'average': 30}
    }
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

extension ParseToString on kPlayerLevel {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

enum kPlayerCategory { GRADESCHOOL, HIGHANDCOLLEGE, PRO }
enum GRADE { A, B, C, D, F, NA }
