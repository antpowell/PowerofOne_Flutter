import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Data/Standard.dart';
import 'package:power_one/Models/PO1HustlePoint.dart';
import 'package:power_one/Models/PO1PlayerSkill.dart';
import 'package:power_one/Models/PO1Point.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Models/PO1Feedback.dart';
import 'package:power_one/Models/PO1Grade.dart';
import 'package:power_one/Models/PO1User.dart';
import 'dart:developer' as dev;

import 'Score/Score.dart';

class PO1Score extends ChangeNotifier {
  Queue<Map<String, IScore>> history = new Queue();

  LinkedHashMap<EPoint, Point> _pointsMap = new LinkedHashMap();
  LinkedHashMap<EPoint, Point> get pointsMap => _pointsMap;

  LinkedHashMap<EHustlePoint, Play> _hustlePointsMap = new LinkedHashMap();
  LinkedHashMap<EHustlePoint, Play> get hustlePointsMap => _hustlePointsMap;

  List<IScore> improvementAreas = [];

  PO1Score() {
    init();
  }

  made(IScore activity) {
    Map<String, IScore> madeHistoryEvent;
    if (_hustlePointsMap.containsValue(activity)) {
      _hustlePointsMap[EHustlePoint.values.find(activity.title)] =
          activity.make();
      madeHistoryEvent = {
        "made": _hustlePointsMap[EHustlePoint.values.find(activity.title)]
      };
    } else {
      _pointsMap[EPoint.values.find(activity.title)] = activity.make();
      madeHistoryEvent = {
        "made": _pointsMap[EPoint.values.find(activity.title)]
      };
    }

    debugPrint('Action: $activity : pos-> ${activity.pos}');
    history.addLast(madeHistoryEvent);
    notifyListeners();
  }

  missed(IScore activity) {
    _pointsMap[EPoint.values.find(activity.title)] = activity.miss();
    history.addLast({"miss": _pointsMap[EPoint.values.find(activity.title)]});
    debugPrint('Action: $activity : neg-> ${activity.neg}');
    notifyListeners();
  }

  undo() {
    dev.log('History state', name: 'history', error: {'data': history});
    if (history.isNotEmpty) {
      Map<String, IScore> undoEvent = history.removeLast();
      (undoEvent.keys.first == "made")
          ? (_hustlePointsMap.containsValue(undoEvent.values.first))
              ? _hustlePointsMap[
                      EHustlePoint.values.find(undoEvent.values.first.title)] =
                  undoEvent.values.first.undoMake()
              : _pointsMap[EPoint.values.find(undoEvent.values.first.title)] =
                  undoEvent.values.first.undoMake()
          : _pointsMap[EPoint.values.find(undoEvent.values.first.title)] =
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
    for (var value in EHustlePoint.values) {
      _hustlePointsMap[value] = new Play(value);
    }
    for (var value in EPoint.values) {
      _pointsMap[value] = new Point(value);
    }

    history = new Queue();
    debugPrint('IPoints created!');
  }

  IScore getActivity(String activityName) {
    return (_pointsMap.containsKey(EPoint.values.find(activityName)))
        ? _pointsMap[EPoint.values.find(activityName)]
        : _hustlePointsMap[EHustlePoint.values.find(activityName)];
  }

  Set<LinkedHashMap<Enum, IScore>> returnPowerOfOneCollectionSet() {
    return {_hustlePointsMap, _pointsMap};
  }

  int getTotalPointsScored() {
    int totalPointsScored = 0;
    _pointsMap.forEach((key, value) {
      switch (key.translatedName) {
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
        switch (key.translatedName) {
          case '1PT':
            _averages[key.translatedName] = value.avg();
            break;
          case '2PTs':
            _averages[key.translatedName] = value.avg();
            break;
          case '3PTs':
            _averages[key.translatedName] = value.avg();
            break;
        }
      },
    );

    // TODO: Check to see if this solution works for FG average
    _averages['FG'] = ((_pointsMap[EPoint.TWO].pos +
                _pointsMap[EPoint.THREE].pos +
                _pointsMap[EPoint.TWO].neg +
                _pointsMap[EPoint.THREE].neg) ==
            0)
        ? 0.0
        : ((_pointsMap[EPoint.TWO].pos + _pointsMap[EPoint.THREE].pos) /
                (_pointsMap[EPoint.TWO].pos +
                    _pointsMap[EPoint.THREE].pos +
                    _pointsMap[EPoint.TWO].neg +
                    _pointsMap[EPoint.THREE].neg) *
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
      if (key == EHustlePoint.TO) {
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
    if ((history.length - _hustlePointsMap[EHustlePoint.PF].pos) >=
        Standard.miniThresholdByPlayerLevel()) {
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
      "ServerTime": ServerValue.timestamp,
      "ReportCard": reportCard,
      "ScoreCard": _mapToJSON(),
      "PlayerLevel": PO1User().playerSkill.toShortString(),
    };
  }

  Map _mapToJSON() {
    Map<String, Map<String, int>> jsonMap = Map();
    _hustlePointsMap.forEach((key, value) {
      jsonMap[key.name] = {'made': value.pos};
    });
    _pointsMap.forEach((key, value) {
      jsonMap[key.name] = {'made': value.pos, 'missed': value.neg};
    });

    return jsonMap;
  }
}
