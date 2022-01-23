import 'package:power_one/Data/Standard.dart';
import 'package:power_one/Models/PO1HustlePoint.dart';
import 'package:power_one/Models/PO1Level.dart';
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
    Map<EHustlePoint, Play> totalhustlepoints,
  ) {
    totalhustlepoints.forEach((key, value) {
      switch (key) {
        case EHustlePoint.STL:
          {
            if (value.pos >= _standards.getSteals['great']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GREAT);
              break;
            } else if (value.pos >= _standards.getSteals['good']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GOOD);
              break;
            } else if (value.pos >= _standards.getSteals['average']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.AVERAGE);
              break;
            } else {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.BELOW_AVERAGE);
              break;
            }
            break;
          }
        case EHustlePoint.RB:
          {
            if (value.pos >= _standards.getRebounds['great']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GREAT);
              break;
            } else if (value.pos >= _standards.getRebounds['good']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GOOD);
              break;
            } else if (value.pos >= _standards.getRebounds['average']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.AVERAGE);
              break;
            } else {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.BELOW_AVERAGE);
              break;
            }
            break;
          }
        case EHustlePoint.BLK:
          {
            if (value.pos >= _standards.getBlocks['great']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GREAT);
              ;
              break;
            } else if (value.pos >= _standards.getBlocks['good']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GOOD);
              ;
              break;
            } else if (value.pos >= _standards.getBlocks['average']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.AVERAGE);
              ;
              break;
            } else {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.BELOW_AVERAGE);
              ;
              break;
            }
            break;
          }
        case EHustlePoint.TO:
          {
            if (value.pos == _standards.getTurnOvers['great']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GREAT);
              break;
            } else if (value.pos <= _standards.getTurnOvers['good']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GOOD);
              break;
            } else if (value.pos <= _standards.getTurnOvers['average']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.AVERAGE);
              break;
            } else {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.BELOW_AVERAGE);
            }
            break;
          }
        case EHustlePoint.AST:
          {
            if (value.pos >= _standards.getAssists['great']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GREAT);
              break;
            } else if (value.pos >= _standards.getAssists['good']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.GOOD);
              break;
            } else if (value.pos >= _standards.getAssists['average']) {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.AVERAGE);
              break;
            } else {
              _hustlepointsfeedback[key.name] =
                  _standards.getFeedback(key, PO1FeedbackLevel.BELOW_AVERAGE);
            }
            break;
          }
        case EHustlePoint.PF:
          // do nothing; no points to calculate atm
          break;
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
