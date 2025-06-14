import 'dart:developer' as dev;
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:power_of_one_basketball/Objects/PO1Score.dart';
import 'package:power_of_one_basketball/Services/RevenueCat/revenue_cat_service.dart';
import 'package:power_of_one_basketball/Services/core_services.dart';
import 'package:power_of_one_basketball/models/PO1Subscription.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'PO1Level.dart';
import 'PO1PlayerSkill.dart';

class PO1User {
  static final PO1User _instance = PO1User._();
  static PO1User get instance => _instance;

  late String _email;
  String get email => _email;
  setEmail(String email) {
    _email = email;
  }

  // ignore: non_constant_identifier_names
  String? _RCAppUserID;
  String? get rcAppUserId => _RCAppUserID;
  setRCAppUserId(String appUserId) {
    _RCAppUserID = appUserId;
  }

  late Subscription _subscription;
  Subscription get subscription => _subscription;

  ///e@g.com
  ///split('.'): [0]: e@g, [1].com
  String emailSignature() {
    return _email.split('.')[0];
  }

  late String _playerName;
  String get playerName => _playerName;
  setPlayerName(String name) {
    dev.log('received player name as $name');
    _playerName = name;
  }

  late String _teamName;
  String get teamName => _teamName;
  setTeamName(String name) {
    dev.log('received team name as $name');
    _teamName = name;
  }

  late String _id;
  String get id => _id;
  setId(String fbUid) {
    // TODO: consider using HMAC-SHA256 ref: https://pub.dev/packages/crypto
    // _subscription = new Subscription()
    _id = fbUid;
  }

  late PO1Score _score;
  PO1Score get score => _score;
  setPlayerScore(PO1Score score) {
    dev.log('received PO1 Score $score');
    _score = score;
  }

  PO1PlayerSkill? _playerSkill;
  PO1PlayerSkill? get playerSkill => _playerSkill;
  set playerSkill(PO1PlayerSkill? playerSkill) {
    _playerSkill = playerSkill;
  }

  PO1Levels get playerLevel =>
      (_playerSkill == PO1PlayerSkill.elementary ||
          _playerSkill == PO1PlayerSkill.middle)
      ? PO1Levels.GRADE
      : (_playerSkill == PO1PlayerSkill.high ||
            _playerSkill == PO1PlayerSkill.college)
      ? PO1Levels.COLHIGH
      : PO1Levels.PRO;

  factory PO1User() {
    return _instance;
  }

  PO1User._() {
    // final InnAppPurchaseService _purchaseService =
    //     context.read<InnAppPurchaseService>();
    // _subscription = new Subscription.;

    // dev.log('user created as: ${this._email}');
  }

  firebaseInit({required User fbUser}) async {
    String email = fbUser.email ?? 'anonymous user';

    setEmail(email);
    setId(fbUser.uid);
    LogInResult? results = await RevenueCatService.logIn(fbUser);

    _subscription = Subscription(logInResults: results);
    _subscription.setTrialEndTime(
      creationTime: fbUser.metadata.creationTime ?? null,
    );
  }

  clearData() {
    // TODO: clear email when user signs out
    // _email = null;
    // _playerName = null;
    _score.clear();
    dev.log('Local user data cleared');
  }

  static fetchSubscription() {
    // return InAppPurchaseException.f
  }

  Map<String, dynamic> toJSON() {
    log('id: $_id');
    Map<String, String> name = PlayerOrTeamService.isPlayer
        ? {'playerName': playerName.trim()}
        : {'teamName': _teamName.trim()};

    Map<String, dynamic> userData = {
      'email': _email.trim(),
      'id': _id,
      ...name,
      'subscription': _subscription.toJSON(),
      // 'score': _score,
    };
    return userData;
  }
}
