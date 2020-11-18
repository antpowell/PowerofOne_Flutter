import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/PO1Score.dart';

class User {
  String email;
  String playerName;
  PO1Score score;
  kPlayerCategory level;
  bool tAndD;

  User(
    this.email, {
    this.playerName,
    this.score,
    this.level = kPlayerCategory.amature,
  });
}
