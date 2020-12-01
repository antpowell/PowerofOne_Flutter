import 'package:power_one/Data/constants.dart';
import 'dart:developer' as dev;

import 'package:power_one/models/PO1User.dart';
import 'dart:developer' as dev;

class PO1Game {
  PO1User _user = PO1User();

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> gameData = {
      _user.emailSignature(): {
        _user.playerName: _user.score.toJSON(),
      }
    };
    dev.log(gameData.toString());
    return gameData;
  }
}
