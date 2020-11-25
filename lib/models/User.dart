import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'dart:developer' as dev;

class User {
  static final User _instance = User._init();

  String _email;
  String get email => _email;
  setEmail(String email) {
    dev.log('recieved email as $email');
    _email = email;
  }

  String _playerName;
  String get playerName => _playerName;
  setPlayerName(String name) {
    dev.log('recieved player name as $name');
    _playerName = name;
  }

  PO1Score _score;
  PO1Score get score => _score;
  setPlayerScore(PO1Score score) {
    dev.log('recieved PO1 Score $score');
    _score = score;
  }

  kPlayerCategory _level;

  factory User() {
    return _instance;
  }

  User._init() {
    dev.log('user created as: ${this._email}');
  }
}
