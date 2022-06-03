import 'dart:developer' as dev;

import 'package:purchases_flutter/models/purchaser_info_wrapper.dart';

class Subscription {
  static final Subscription _instance = Subscription._init();
  static int _weekInMilli = 604800000;
  static int _monthInMilli = 2592000000;
  static int _halfYearInMilli = 1577846000;
  static int _yearInMilli = 31536000000;
  static bool _newAccount = false;
  // final formatter = DateFormat;

  static int _trailEndTime;
  bool _isActive = false, _inTrial = /*true*/ false;

  List<String> _activeSubscription;
  setSubscription({List<String> subscriptionPackage}) {
    _activeSubscription = subscriptionPackage;
    // check skus
    _isActive = true;
  }

  PurchaserInfo _purchaserInfo;
  PurchaserInfo get purchaserInfo => _purchaserInfo;
  setPurchaseInfo(PurchaserInfo purchaserInfo) {
    _purchaserInfo = purchaserInfo;
    // TODO: Identify what needs to be used to determine if the user has a trial/subscrption
  }

  getTrialTimeLeft() {
    return DateTime(_trailEndTime - DateTime.now().millisecondsSinceEpoch);
  }

  bool hasSubscription() {
    return _isActive;
  }

  bool inTrial() {
    return _inTrial;
  }

  Map<String, dynamic> toJSON() {
    return {
      "inTrial": _inTrial,
      "isActive": _isActive,
      "trialEndTime": _trailEndTime
    };
  }

// Singleton boilerplate
  factory Subscription({newAccount: bool}) {
    _newAccount = newAccount;
    return _instance;
  }

  Subscription._init() {
    // dbRefgetUsersSubscription();

    dev.log('User subscription data: ${toJSON()}');
    // _trailEndTime = DateTime.now().millisecondsSinceEpoch + _weekInMilli;
    if (_newAccount) {
      _trailEndTime =
          DateTime.now().add(Duration(days: 7)).millisecondsSinceEpoch;
    }
  }
}
