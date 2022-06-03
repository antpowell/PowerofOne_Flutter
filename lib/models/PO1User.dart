import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:power_one/Models/PO1Subscription.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Services/RevenueCat/revenue_cat_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:developer' as dev;

import 'PO1Level.dart';
import 'PO1PlayerSkill.dart';

class PO1User {
  static final PO1User _instance = PO1User._();
  static PO1User get instance => _instance;

  String _email;
  String get email => _email;
  setEmail(String email) {
    _email = email;
  }

  String _RCAppUserID;
  String get rcAppUserId => _RCAppUserID;
  setRCAppUserId(String appUserId) {
    _RCAppUserID = appUserId;
  }

  Subscription _subscription;
  Subscription get subscription => _subscription;

  ///e@g.com
  ///split('.'): [0]: e@g, [1].com
  String emailSignature() => _email.split('.')[0];

  String _playerName;
  String get playerName => _playerName;
  setPlayerName(String name) {
    dev.log('received player name as $name');
    _playerName = name;
  }

  String _id;
  String get id => _id;
  setId(String fbUid) {
    // TODO: consider using HMAC-SHA256 ref: https://pub.dev/packages/crypto
    // _subscription = new Subscription()
    _id = fbUid;
  }

  PO1Score _score;
  PO1Score get score => _score;
  setPlayerScore(PO1Score score) {
    dev.log('received PO1 Score $score');
    _score = score;
  }

  PO1PlayerSkill _playerSkill;
  PO1PlayerSkill get playerSkill => _playerSkill;
  set playerSkill(PO1PlayerSkill playerSkill) {
    _playerSkill = playerSkill;
  }

  PO1Levels _playerLevel;
  PO1Levels get playerLevel => (_playerSkill == PO1PlayerSkill.elementary ||
          _playerSkill == PO1PlayerSkill.middle)
      ? PO1Levels.GRADE
      : (_playerSkill == PO1PlayerSkill.high ||
              _playerSkill == PO1PlayerSkill.college)
          ? PO1Levels.COLHIGH
          : PO1Levels.PRO;

  factory PO1User() {
    return _instance;
  }

  // PO1User.firebaseInit(String email, String fbUid) {
  //   _email = email;
  //   _id = fbUid;
  //   _subscription = Subscription(newAccount: false);
  // }

  PO1User._() {
    // final InnAppPurchaseService _purchaseService =
    //     context.read<InnAppPurchaseService>();
    // _subscription = new Subscription.;
    dev.log('user created as: ${this._email}');
  }

  firebaseInit(String email, String firebaseUid) async {
    setEmail(email);
    setId(firebaseUid);
    LogInResult results = await RevenueCatService().logIn(firebaseUid);

    _subscription = Subscription(newAccount: results.created);
    _subscription.setPurchaseInfo(results.purchaserInfo);
  }

  clearData() {
    // TODO: clear email when user signs out
    // _email = null;
    _playerName = null;
    _playerLevel = null;
    _score.clear();
    dev.log('Local user data cleared');
  }

  static fetchSubscription() {
    // return InAppPurchaseException.f
  }

  Map<String, dynamic> toJSON() {
    debugPrint('id: $_id');
    return {
      'email': _email.trim(),
      'id': _id,
      'playerName': _playerName.trim(),
      'subscription': _subscription.toJSON(),
      // 'score': _score,
    };
  }
}
