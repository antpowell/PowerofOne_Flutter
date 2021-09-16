import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/models/PO1Feedback.dart';
import 'package:power_one/models/PO1Grade.dart';
import 'package:power_one/models/PO1User.dart';
import 'dart:developer' as dev;

import 'Score/Score.dart';

/* Skeleton for differnt player levels */
// enum _powerOfOneGrades { A, B, C, D, F }
// enum _playerLevel { elementry, middle, college, pro }

class PO1Score extends ChangeNotifier {
  static final int minimumThreshold = 10;
  // static PO1User _user;

  Queue<Map<String, IScore>> history = new Queue();

  LinkedHashMap<String, Point> _pointsMap = new LinkedHashMap();
  LinkedHashMap<String, Point> get pointsMap => _pointsMap;

  LinkedHashMap<String, Play> _hustlePointsMap = new LinkedHashMap();
  LinkedHashMap<String, Play> get hustlePointsMap => _hustlePointsMap;

  List<IScore> improvementAreas = [];

  PO1Score() {
    init();
  }

  // assignUser(PO1User user) {
  //   _user = user;
  // }

  made(IScore activity) {
    Map<String, IScore> madeHistoryEvent;
    if (_hustlePointsMap.containsValue(activity)) {
      _hustlePointsMap[activity.title] = activity.make();
      madeHistoryEvent = {"made": _hustlePointsMap[activity.title]};
    } else {
      _pointsMap[activity.title] = activity.make();
      madeHistoryEvent = {"made": _pointsMap[activity.title]};
    }

    debugPrint('Action: $activity : pos-> ${activity.pos}');
    history.addLast(madeHistoryEvent);
    notifyListeners();
  }

  missed(IScore activity) {
    _pointsMap[activity.title] = activity.miss();
    history.addLast({"miss": _pointsMap[activity.title]});
    debugPrint('Action: $activity : neg-> ${activity.neg}');
    notifyListeners();
  }

  undo() {
    dev.log('History state', name: 'history', error: {'data': history});
    if (history.isNotEmpty) {
      Map<String, IScore> undoEvent = history.removeLast();
      (undoEvent.keys.first == "made")
          ? (_hustlePointsMap.containsValue(undoEvent.values.first))
              ? _hustlePointsMap[undoEvent.values.first.title] =
                  undoEvent.values.first.undoMake()
              : _pointsMap[undoEvent.values.first.title] =
                  undoEvent.values.first.undoMake()
          : _pointsMap[undoEvent.values.first.title] =
              undoEvent.values.first.undoMiss();
    } else {
      dev.log("Empty history list",
          name: 'Empty history list',
          error: {'data': 'Event history is empty, no prior events'});
    }
    notifyListeners();
  }

  clear() {
    // FIXME: crashes on clearing data.
    if (history.isNotEmpty) {
      init();
      dev.log(_pointsMap.toString());
    } else {
      dev.log('history is already clear.');
    }
    // notifyListeners();
  }

  init() {
    kLabels["points"]?.forEach((element) {
      _pointsMap[element] = new Point(element);
    });
    kLabels["hustle_points"]?.forEach((element) {
      _hustlePointsMap[element] = new Play(element);
    });
    history = new Queue();
    debugPrint('IPoints created!');
  }

  IScore getActivity(String activityName) {
    return (_pointsMap.containsKey(activityName))
        ? _pointsMap[activityName]
        : _hustlePointsMap[activityName];
  }

  Set<LinkedHashMap<String, IScore>> returnPowerOfOneCollectionSet() {
    return {_hustlePointsMap, _pointsMap};
  }

  int getTotalPointsScored() {
    int totalPointsScored = 0;
    _pointsMap.forEach((key, value) {
      switch (key) {
        case '1PT':
          totalPointsScored += value.pos;
          break;
        case '2PTs':
          totalPointsScored += (value.pos * 2);
          break;
        case '3PTs':
          totalPointsScored += (value.pos * 3);
          break;
      }
    });
    return totalPointsScored;
  }

  Map<String, double> getAverages() {
    Map<String, double> _averages = {};
    _pointsMap.forEach(
      (key, value) {
        switch (key) {
          case '1PT':
            _averages[key] = value.avg();
            break;
          case '2PTs':
            _averages[key] = value.avg();
            break;
          case '3PTs':
            _averages[key] = value.avg();
            break;
        }
      },
    );

    // TODO: Check to see if this solution works for FG average
    _averages['FG'] = ((_pointsMap['2PTs'].pos +
                _pointsMap['3PTs'].pos +
                _pointsMap['2PTs'].neg +
                _pointsMap['3PTs'].neg) ==
            0)
        ? 0.0
        : ((_pointsMap['2PTs'].pos + _pointsMap['3PTs'].pos) /
                (_pointsMap['2PTs'].pos +
                    _pointsMap['3PTs'].pos +
                    _pointsMap['2PTs'].neg +
                    _pointsMap['3PTs'].neg) *
                100)
            .roundToDouble();

    return _averages;
  }

  int _getPowerOfOneScore() {
    int powerOfOneScore = 0;

    _pointsMap.forEach((key, value) {
      powerOfOneScore += value.total();
      if (value.total() < 0) {
        improvementAreas.add(value);
      }
    });
    _hustlePointsMap.forEach((key, value) {
      if (key == 'TO') {
        powerOfOneScore -= value.total();
      } else {
        powerOfOneScore += value.total();
      }
      if (value.total() < 0) {
        improvementAreas.add(value);
      }
    });
    dev.log('PO1 Score: --> $powerOfOneScore');
    return powerOfOneScore;
  }

  String powerOfOneGrade() {
    return metPlaytimeThreshold()
        ? PO1Grade.calculateGrade(_getPowerOfOneScore())
        : 'NA';
  }

  bool metPlaytimeThreshold() {
    if (history.length >= minimumThreshold) {
      return true;
    }

    return false;
  }

  Map<String, dynamic> toJSON() {
    final reportCard = {
      "Feedback": PO1Feedback.toJSON(),
      "Grade": powerOfOneGrade(),
      "Score": _getPowerOfOneScore(),
      "PointsScored": getTotalPointsScored()
    };
    final scoreCard = {
      'assist': '',
      'blocks': '',
      'freeThrows': '',
      'offRebounds': '',
      'steals': '',
      'threePointers': '',
      'turnOvers': '',
      'twoPointers': ''
    };
    final data = {
      ...reportCard,
      ...scoreCard,
    };
    data.addAll({
      "ReportCard": reportCard,
      "ScoreCard": {
        ..._hustlePointsMap,
        ..._pointsMap,
      },
    });
    return {
      "ReportCard": reportCard,
      "ScoreCard": _mapToJSON(),
    };
  }

  Map _mapToJSON() {
    Map<String, Map<String, int>> jsonMap = Map();
    _hustlePointsMap.forEach((key, value) {
      jsonMap[key] = {'made': value.pos};
    });
    _pointsMap.forEach((key, value) {
      jsonMap[key] = {'made': value.pos, 'missed': value.neg};
    });

    return jsonMap;
  }
}
