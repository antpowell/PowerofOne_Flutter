import 'dart:developer' as dev;

import 'package:purchases_flutter/models/package_wrapper.dart';

class Subscription {
  static final Subscription _instance = Subscription._init();
  bool _isActive = false;
  Package subscriptionType;
  int _trialTimeLeft, _trialTimerStart, _trialTimerEnd;

  setSubscription({isActive: bool, trialTimeLeft: double}) {
    this._isActive = isActive;
    this._trialTimeLeft = trialTimeLeft;
  }

  getSubscription() {
    return {
      this._isActive,
      this._trialTimeLeft,
    };
  }

  Map<String, dynamic> toJSON() {
    return {"isActive": _isActive, "timeLeft": _trialTimeLeft};
  }

// Singleton boilerplate
  factory Subscription() {
    return _instance;
  }

  Subscription._init() {
    // dbRefgetUsersSubscription();
    dev.log('User subscription data: ${_instance.toJSON()}');
    _trialTimerStart = DateTime.now().millisecondsSinceEpoch;
  }
}
