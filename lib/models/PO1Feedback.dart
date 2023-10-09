import 'package:power_one/Data/Standard.dart';
import 'package:power_one/Models/PO1HustlePoint.dart';
import 'package:power_one/Models/PO1Level.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/Models/PO1User.dart';
import 'package:power_one/Services/core_services.dart';

class PO1Feedback {
  static Map<String, String> _hustlePointsFeedback = {};
  static Map<String, String> get hustlePointsFeedback => _hustlePointsFeedback;

  static Map<String, String> _scoredpointsfeedback = {};
  static Map<String, String> get scoredpointsfeedback => _scoredpointsfeedback;

  static Standard _standards = new Standard(user: _user);

  static PO1User _user = PO1User();

  static calculateFeedback(PO1Score score) {
    _hustlePointsfeedback(score.hustlePointsMap);
    _scoredPointsFeedback(score.getAverages());
  }

  static Map<String, String> _hustlePointsfeedback(
    Map<EHustlePoint, Play> totalHustlePoints,
  ) {
    totalHustlePoints.forEach(
      (key, value) {
        if (PlayerOrTeamService.isTeam) {
          _hustlePointsFeedback[key.name] = 'NA';
        } else {
          switch (key) {
            case EHustlePoint.STL:
              {
                if (value.pos >= _standards.getSteals['great']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                  break;
                } else if (value.pos >= _standards.getSteals['good']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                  break;
                } else if (value.pos >= _standards.getSteals['average']) {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.AVERAGE);
                  break;
                } else {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.BELOW_AVERAGE);
                  break;
                }
                break;
              }
            case EHustlePoint.RB:
              {
                if (value.pos >= _standards.getRebounds['great']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                  break;
                } else if (value.pos >= _standards.getRebounds['good']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                  break;
                } else if (value.pos >= _standards.getRebounds['average']) {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.AVERAGE);
                  break;
                } else {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.BELOW_AVERAGE);
                  break;
                }
                break;
              }
            case EHustlePoint.BLK:
              {
                if (value.pos >= _standards.getBlocks['great']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                  break;
                } else if (value.pos >= _standards.getBlocks['good']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                  break;
                } else if (value.pos >= _standards.getBlocks['average']) {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.AVERAGE);
                  break;
                } else {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.BELOW_AVERAGE);
                  break;
                }
                break;
              }
            case EHustlePoint.TO:
              {
                if (value.pos == _standards.getTurnOvers['great']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                  break;
                } else if (value.pos <= _standards.getTurnOvers['good']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                  break;
                } else if (value.pos <= _standards.getTurnOvers['average']) {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.AVERAGE);
                  break;
                } else {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.BELOW_AVERAGE);
                }
                break;
              }
            case EHustlePoint.AST:
              {
                if (value.pos >= _standards.getAssists['great']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GREAT);
                  break;
                } else if (value.pos >= _standards.getAssists['good']) {
                  _hustlePointsFeedback[key.name] = _standards
                      .getFeedbackForHustlePoints(key, PO1FeedbackLevel.GOOD);
                  break;
                } else if (value.pos >= _standards.getAssists['average']) {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.AVERAGE);
                  break;
                } else {
                  _hustlePointsFeedback[key.name] =
                      _standards.getFeedbackForHustlePoints(
                          key, PO1FeedbackLevel.BELOW_AVERAGE);
                }
                break;
              }
            case EHustlePoint.PF:
              // do nothing; no points to calculate atm
              break;
          }
        }
      },
    );
    return _hustlePointsFeedback;
  }

  static Map<String, String> _scoredPointsFeedback(
    Map<String, double> averages,
  ) {
    averages.forEach(
      (key, value) {
        switch (key) {
          case 'FG':
            {
              if (value >= _standards.fieldGoal['great']) {
                _scoredpointsfeedback[key] = _standards.getFeedbackForPoints(
                    key, PO1FeedbackLevel.GREAT);
                break;
              } else if (value >= _standards.fieldGoal['good']) {
                _scoredpointsfeedback[key] =
                    _standards.getFeedbackForPoints(key, PO1FeedbackLevel.GOOD);
                break;
              } else if (value >= _standards.fieldGoal['average']) {
                _scoredpointsfeedback[key] = _standards.getFeedbackForPoints(
                    key, PO1FeedbackLevel.AVERAGE);
                break;
              } else {
                _scoredpointsfeedback[key] = _standards.getFeedbackForPoints(
                    key, PO1FeedbackLevel.BELOW_AVERAGE);
                break;
              }
            }
            break;
          case '1PT':
            {
              if (value >= _standards.freeThrow['great']) {
                _scoredpointsfeedback[key] = _standards.getFeedbackForPoints(
                    'FT', PO1FeedbackLevel.GREAT);
                break;
              } else if (value >= _standards.freeThrow['good']) {
                _scoredpointsfeedback[key] = _standards.getFeedbackForPoints(
                    'FT', PO1FeedbackLevel.GOOD);
                break;
              } else if (value >= _standards.freeThrow['average']) {
                _scoredpointsfeedback[key] = _standards.getFeedbackForPoints(
                    'FT', PO1FeedbackLevel.AVERAGE);
                break;
              } else {
                _scoredpointsfeedback[key] = _standards.getFeedbackForPoints(
                    'FT', PO1FeedbackLevel.BELOW_AVERAGE);
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
    jsonMap.addAll(_hustlePointsFeedback);
    jsonMap.addAll(_scoredpointsfeedback);

    return jsonMap;
  }
}
