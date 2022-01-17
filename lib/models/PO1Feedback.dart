import 'package:power_one/Data/Standard.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Models/PO1User.dart';

class PO1Feedback {
  static Map<String, String> _hustlepointsfeedback = {};
  static Map<String, String> get hustlepointsfeedback => _hustlepointsfeedback;

  static Map<String, String> _scoredpointsfeedback = {};
  static Map<String, String> get scoredpointsfeedback => _scoredpointsfeedback;

  static Standard _standards = new Standard(user: _user);

  static PO1User _user = PO1User();

  static calculateFeedback(PO1Score score) {
    _hustlePointsfeedback(score.hustlePointsMap);
    _scoredPointsFeedback(score.getAverages());
  }

  static Map<String, String> _hustlePointsfeedback(
    Map<String, Play> totalhustlepoints,
  ) {
    totalhustlepoints.forEach((key, value) {
      switch (key) {
        case 'STL':
          {
            if (value.pos >= _standards.getSteals['great']) {
              _hustlepointsfeedback[key] = 'Excellent Job!';
              break;
            } else if (value.pos >= _standards.getSteals['good']) {
              _hustlepointsfeedback[key] = 'Keep up the Good Work';
              break;
            } else if (value.pos >= _standards.getSteals['average']) {
              _hustlepointsfeedback[key] = 'Average; Keep Hands Up';
              break;
            } else {
              _hustlepointsfeedback[key] = 'Improvement Needed; Work Harder';
              break;
            }
            break;
          }
        case 'RB':
          {
            if (value.pos >= _standards.getRebounds['great']) {
              _hustlepointsfeedback[key] = 'Excellent Job!';
              break;
            } else if (value.pos >= _standards.getRebounds['good']) {
              _hustlepointsfeedback[key] = 'Keep up the Good Work';
              break;
            } else if (value.pos >= _standards.getRebounds['average']) {
              _hustlepointsfeedback[key] = 'Average; Hit the Boards Harder';
              break;
            } else {
              _hustlepointsfeedback[key] = 'Improvement Needed; Work Harder';
              break;
            }
            break;
          }
        case 'BLK':
          {
            if (value.pos >= _standards.getBlocks['great']) {
              _hustlepointsfeedback[key] = 'Excellent Job!';
              break;
            } else if (value.pos >= _standards.getBlocks['good']) {
              _hustlepointsfeedback[key] = 'Keep up the Good Work';
              break;
            } else if (value.pos >= _standards.getBlocks['average']) {
              break;
            } else {
              _hustlepointsfeedback[key] = 'Be Aggressive';
              break;
            }
            break;
          }
        case 'TO':
          {
            if (value.pos == _standards.getTurnOvers['great']) {
              _hustlepointsfeedback[key] = 'Excellent Job!';
              break;
            } else if (value.pos <= _standards.getTurnOvers['good']) {
              _hustlepointsfeedback[key] = 'Keep up the Good Work';
              break;
            } else if (value.pos <= _standards.getTurnOvers['average']) {
              _hustlepointsfeedback[key] = 'Average; Protect the Ball';
              break;
            } else {
              _hustlepointsfeedback[key] =
                  'Improvement Needed; Work on Protecting Ball';
            }
            break;
          }
        case 'AST':
          {
            if (value.pos >= _standards.getAssists['great']) {
              _hustlepointsfeedback[key] = 'Excellent Job!';
              break;
            } else if (value.pos >= _standards.getAssists['good']) {
              _hustlepointsfeedback[key] = 'Keep up the Good Work';
              break;
            } else if (value.pos >= _standards.getAssists['average']) {
              _hustlepointsfeedback[key] = 'Average;Get Assists Up!';
              break;
            } else {
              _hustlepointsfeedback[key] =
                  'Improvement Needed; Focus on Passing';
            }
            break;
          }
      }
    });
    return _hustlepointsfeedback;
  }

  static Map<String, String> _scoredPointsFeedback(
    Map<String, double> averages,
  ) {
    averages.forEach(
      (key, value) {
        switch (key) {
          case 'FG':
            {
              if (value >= _standards.feildGoal['great']) {
                _scoredpointsfeedback[key] = 'Excellent Job!';
                break;
              } else if (value >= _standards.feildGoal['good']) {
                _scoredpointsfeedback[key] = 'Keep up the good work';
                break;
              } else if (value >= _standards.feildGoal['average']) {
                _scoredpointsfeedback[key] =
                    'Currently Average; Increase your skill level';
                break;
              } else {
                _scoredpointsfeedback[key] =
                    'Improvement Needed; Focus on shooting more field goals in practice';
              }
            }
            break;
          case '1PT':
            {
              if (value >= _standards.freeThrow['great']) {
                _scoredpointsfeedback[key] = 'Excellent Job!';
                break;
              } else if (value >= _standards.freeThrow['good']) {
                _scoredpointsfeedback[key] = 'Keep up the good work';
                break;
              } else if (value >= _standards.freeThrow['average']) {
                _scoredpointsfeedback[key] =
                    'Currently Average; Increase your skill level';
                break;
              } else {
                _scoredpointsfeedback[key] =
                    'Improvement Needed;Focus on shooting more free throws in practice';
              }
            }
            break;
        }
      },
    );
    return _scoredpointsfeedback;
  }

/* 
?? Expected output

Feedback: {
 1PT: 'feedback',
 FG: 'feedback',
 AST: 'feedback',
 STL: 'feedback',
 TO: 'feedback',
 ORB: 'feedback',
 BLK: 'feedback',
}
 */
  static Map toJSON() {
    Map<String, String> jsonMap = Map();
    jsonMap.addAll(_hustlepointsfeedback);
    jsonMap.addAll(_scoredpointsfeedback);

    return jsonMap;
  }
}
