import 'dart:developer' as dev;

import 'package:power_one/Models/PO1User.dart';
import 'package:power_one/Services/core_services.dart';

class PO1Game {
  PO1User _user = PO1User();

  Map<String, dynamic> toJSON() {
    String name = PlayerOrTeamService.isPlayer
        ? _user.playerName.trim()
        : _user.teamName.trim();
    Map<String, dynamic> gameData = {
      _user.emailSignature(): {
        name: _user.score.toJSON(),
      }
    };
    dev.log(gameData.toString());
    return gameData;
  }
}
