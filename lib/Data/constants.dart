import 'package:flutter/material.dart';

const kTheme = {};

const kLabels = {
  'points': [
    '1PT',
    '2PTs',
    '3PTs',
    'STLS',
  ],
  'plays': [
    'ORB',
    'ASST',
    'BLKS',
    'TO',
  ],
};

const List<Map<String, Object>> kPoints = [
  {'label': '1PT', 'dual': true},
  {'label': '2PTs', 'dual': true},
  {'label': '3PTs', 'dual': true},
  {'label': 'ORB', 'dual': false},
  {'label': 'ASST', 'dual': false},
  {'label': 'STLS', 'dual': false},
  {'label': 'TO', 'dual': false},
  {'label': 'BLKS', 'dual': false},
];

const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.white,
);

const TextStyle kNumberTextStyle = TextStyle(
  fontSize: 32,
  color: Colors.white,
);
