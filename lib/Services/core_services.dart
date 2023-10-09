import 'package:flutter/foundation.dart';

class PlayerOrTeamService extends ChangeNotifier {
  static bool isPlayer, isTeam;

  PlayerOrTeamService() {
    isPlayer = true;
    isTeam = false;
  }

  bool get isPlayerState => isPlayer;

  bool get isTeamState => isTeam;

  // The function toggles the state of the player's team.
  void togglePlayerTeamState() {
    isPlayer = !isPlayer;
    isTeam = !isTeam;
    notifyListeners();
  }
}
