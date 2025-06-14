import 'package:power_of_one_basketball/Data/Standard.dart';
import 'package:power_of_one_basketball/models/PO1HustlePoint.dart';
import 'package:power_of_one_basketball/models/PO1Level.dart';
import 'package:power_of_one_basketball/Objects/PO1Score.dart';
import 'package:power_of_one_basketball/Objects/Play.dart';
import 'package:power_of_one_basketball/models/PO1User.dart';
import 'package:power_of_one_basketball/Services/core_services.dart';

class PO1Feedback {
  static Map<String, String> _hustlePointsFeedbackObj = {};
  static Map<String, String> get hustlePointsFeedbackObj =>
      _hustlePointsFeedbackObj;

  static Map<String, String> _scoredPointsFeedbackObj = {};
  static Map<String, String> get scoredPointsFeedbackObj =>
      _scoredPointsFeedbackObj;

  static Standard _standards = new Standard(user: _user);

  static PO1User _user = PO1User();

  static calculateFeedback(PO1Score score) {
    _hustlePointsFeedback(score.hustlePointsMap);
    _scoredPointsFeedback(score.getAverages());
  }

  static Map<String, String> _hustlePointsFeedback(
    Map<EHustlePoint, Play> totalHustlePoints,
  ) {
    totalHustlePoints.forEach((key, value) {
      if (PlayerOrTeamService.isTeam) {
        _hustlePointsFeedbackObj[key.name] = 'NA';
      } else {
        switch (key) {
          case EHustlePoint.STL:
            {
              if (value.pos >= _standards.getSteals['great']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                break;
              } else if (value.pos >= _standards.getSteals['good']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                break;
              } else if (value.pos >= _standards.getSteals['average']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.AVERAGE);
                break;
              } else {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(
                      key,
                      PO1FeedbackLevel.BELOW_AVERAGE,
                    );
                break;
              }
            }
          case EHustlePoint.RB:
            {
              if ((value.pos >= _standards.getRebounds['great']!)) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                break;
              } else if (value.pos >= _standards.getRebounds['good']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                break;
              } else if (value.pos >= _standards.getRebounds['average']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.AVERAGE);
                break;
              } else {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(
                      key,
                      PO1FeedbackLevel.BELOW_AVERAGE,
                    );
                break;
              }
            }
          case EHustlePoint.BLK:
            {
              if (value.pos >= _standards.getBlocks['great']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                break;
              } else if (value.pos >= _standards.getBlocks['good']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                break;
              } else if (value.pos >= _standards.getBlocks['average']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.AVERAGE);
                break;
              } else {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(
                      key,
                      PO1FeedbackLevel.BELOW_AVERAGE,
                    );
                break;
              }
            }
          case EHustlePoint.TO:
            {
              if (value.pos == _standards.getTurnOvers['great']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                break;
              } else if (value.pos <= _standards.getTurnOvers['good']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                break;
              } else if (value.pos <= _standards.getTurnOvers['average']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.AVERAGE);
                break;
              } else {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(
                      key,
                      PO1FeedbackLevel.BELOW_AVERAGE,
                    );
              }
              break;
            }
          case EHustlePoint.AST:
            {
              if (value.pos >= _standards.getAssists['great']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                break;
              } else if (value.pos >= _standards.getAssists['good']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                break;
              } else if (value.pos >= _standards.getAssists['average']!) {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(key, PO1FeedbackLevel.AVERAGE);
                break;
              } else {
                _hustlePointsFeedbackObj[key.name] = _standards
                    .getFeedbackForHustlePoints(
                      key,
                      PO1FeedbackLevel.BELOW_AVERAGE,
                    );
              }
              break;
            }
          case EHustlePoint.PF:
            // do nothing; no points to calculate atm
            break;
        }
      }
    });
    return _hustlePointsFeedbackObj;
  }

  static Map<String, String> _scoredPointsFeedback(
    Map<String, double> averages,
  ) {
    averages.forEach((key, value) {
      switch (key) {
        case 'FG':
          {
            if (value >= _standards.fieldGoal['great']!) {
              _scoredPointsFeedbackObj[key] = _standards.getFeedbackForPoints(
                key,
                PO1FeedbackLevel.GREAT,
              );
              break;
            } else if (value >= _standards.fieldGoal['good']!) {
              _scoredPointsFeedbackObj[key] = _standards.getFeedbackForPoints(
                key,
                PO1FeedbackLevel.GOOD,
              );
              break;
            } else if (value >= _standards.fieldGoal['average']!) {
              _scoredPointsFeedbackObj[key] = _standards.getFeedbackForPoints(
                key,
                PO1FeedbackLevel.AVERAGE,
              );
              break;
            } else {
              _scoredPointsFeedbackObj[key] = _standards.getFeedbackForPoints(
                key,
                PO1FeedbackLevel.BELOW_AVERAGE,
              );
              break;
            }
          }
        case '1PT':
          {
            if (value >= _standards.freeThrow['great']!) {
              _scoredPointsFeedbackObj[key] = _standards.getFeedbackForPoints(
                'FT',
                PO1FeedbackLevel.GREAT,
              );
              break;
            } else if (value >= _standards.freeThrow['good']!) {
              _scoredPointsFeedbackObj[key] = _standards.getFeedbackForPoints(
                'FT',
                PO1FeedbackLevel.GOOD,
              );
              break;
            } else if (value >= _standards.freeThrow['average']!) {
              _scoredPointsFeedbackObj[key] = _standards.getFeedbackForPoints(
                'FT',
                PO1FeedbackLevel.AVERAGE,
              );
              break;
            } else {
              _scoredPointsFeedbackObj[key] = _standards.getFeedbackForPoints(
                'FT',
                PO1FeedbackLevel.BELOW_AVERAGE,
              );
            }
          }
          break;
      }
    });
    return _scoredPointsFeedbackObj;
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
    jsonMap.addAll(_hustlePointsFeedbackObj);
    jsonMap.addAll(_scoredPointsFeedbackObj);

    return jsonMap;
  }
}
