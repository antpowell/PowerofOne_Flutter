import 'dart:developer' as dev;

import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:intl/date_symbol_data_local.dart';

class Subscription {
  static final Subscription _instance = Subscription._init();
  static int _weekInMilli = 604800000;
  static int _monthInMilli = 2592000000;
  static int _halfYearInMilli = 1577846000;
  static int _yearInMilli = 31536000000;
  static bool _newAccount = false;
  // final formatter = DateFormat;

  bool _isActive = false, _hasTrial = true;
  Package _activeSubscription;
  static int _trailEndTime;

  setSubscription({subscriptionPackage: Package}) {
    _activeSubscription = subscriptionPackage;
    _isActive = true;
  }

  getTrialTimeLeft() {
    return DateTime(_trailEndTime - DateTime.now().millisecondsSinceEpoch);
  }

  hasSubscription() {
    return {
      this._isActive,
    };
  }

  Map<String, dynamic> toJSON() {
    return {
      "inTrial": _hasTrial,
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

    dev.log('User subscription data: ${_instance.toJSON()}');
    // _trailEndTime = DateTime.now().millisecondsSinceEpoch + _weekInMilli;
    if (_newAccount) {
      _trailEndTime =
          DateTime.now().add(Duration(days: 7)).millisecondsSinceEpoch;
    }
  }
}
