import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Objects/Play.dart';
import 'package:power_one/models/PO1Grade.dart';

class PO1Feedback {
  static Map<String, String> _hustlepointsfeedback = {};
  static Map<String, String> get hustlepointsfeedback => _hustlepointsfeedback;

  static Map<String, String> _scoredpointsfeedback = {};
  static Map<String, String> get scoredpointsfeedback => _scoredpointsfeedback;

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
            if (value.pos >= 2) {
              _hustlepointsfeedback[key] = "Keep up the Good Work";
              break;
            } else if (value.pos == 1) {
              _hustlepointsfeedback[key] = 'Average; Keep Hands Up';
              break;
            } else if (value.pos == 0) {
              _hustlepointsfeedback[key] = 'Improvement Needed; Work Harder';
            }
            break;
          }
        case 'ORB':
          {
            if (value.pos >= 3) {
              _hustlepointsfeedback[key] = "Keep up the Good Work";
              break;
            } else if (value.pos == 2) {
              _hustlepointsfeedback[key] = "Average; Hit the Boards Harder";
              break;
            } else if (value.pos <= 1) {
              _hustlepointsfeedback[key] = "Improvement Needed;Work Harder";
            }
            break;
          }
        case 'BLK':
          {
            if (value.pos >= 1) {
              _hustlepointsfeedback[key] = "Keep up the Good Work";
              break;
            } else if (value.pos == 0) {
              _hustlepointsfeedback[key] = "Be Aggressive";
              break;
            }
            break;
          }
        case 'TO':
          {
            if (value.pos == 0) {
              _hustlepointsfeedback[key] = "Keep up the Good Work";
              break;
            } else if (value.pos == 1) {
              _hustlepointsfeedback[key] = "Average; Protect the Ball";
              break;
            } else if (value.pos >= 2) {
              _hustlepointsfeedback[key] =
                  "Improvement Needed; Work on Protecting Ball";
            }
            break;
          }
        case 'AST':
          {
            if (value.pos >= 4) {
              _hustlepointsfeedback[key] = "Keep being a Team Player";
              break;
            } else if (value.pos == 3) {
              _hustlepointsfeedback[key] = "Average;Get Assists Up!";
              break;
            } else if (value.pos <= 2) {
              _hustlepointsfeedback[key] =
                  "Improvement Needed; Focus on Passing";
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
              if (value >= 40) {
                _scoredpointsfeedback[key] = "Keep up the good work";
                break;
              } else if (value >= 30) {
                _scoredpointsfeedback[key] =
                    'Currently Average; Increase your skill level';
                break;
              } else if (value <= 29) {
                _scoredpointsfeedback[key] =
                    "Improvement Needed; Focus on shooting more field goals in practice";
              }
            }
            break;
          case '1PT':
            {
              if (value >= 70) {
                _scoredpointsfeedback[key] = "Keep up the good work";
                break;
              } else if (value >= 50) {
                _scoredpointsfeedback[key] =
                    'Currently Average; Increase your skill level';
                break;
              } else if (value < 50) {
                _scoredpointsfeedback[key] =
                    'Improvement Needed;Focus on shooting more free throws in practice';
              }
            }
            break;
        }
        ;
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
