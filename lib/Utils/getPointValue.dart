import 'dart:developer';

import 'package:power_one/Models/PO1Level.dart';
import 'package:power_one/Models/PO1User.dart';
import 'package:power_one/Services/core_services.dart';

num findThresholdByPlayerLevel({
  required Set<Map<PO1Levels, num>> pointLevelThreshold,
  required PO1User user,
}) {
  var results = pointLevelThreshold
      .where((element) => element.containsKey(user.playerLevel))
      .first[user.playerLevel];

  if (results == null) {
    log('No threshold found for ${user.playerLevel} level ${pointLevelThreshold.toString()} for ${PlayerOrTeamService.isPlayer ? user.playerName : user.teamName}');
    // throw Exception('No threshold found for ${user.playerLevel}');
    results = 0;
  }

  return results;
}
