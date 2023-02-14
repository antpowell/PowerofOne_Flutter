import 'package:purchases_flutter/purchases_flutter.dart';

class Subscription {
  static bool _newAccount = false;
  static DateTime _trailEndTime;
  bool _isActive = false, _inTrial = true;

  CustomerInfo _customerInfo;
  CustomerInfo get customerInfo => _customerInfo;
  setCustomerInfo(CustomerInfo customerInfo) {
    _customerInfo = customerInfo;
    if (_customerInfo?.entitlements?.all['premium_user']?.isActive ?? false) {
      setActive();
    }
    // TODO: Identify what needs to be used to determine if the user has a trial/subscrption
  }

  setTrialEndTime({DateTime creationTime}) {
    if (creationTime != null) {
      _trailEndTime = creationTime.add(const Duration(days: 7));
      _inTrial = _trailEndTime.difference(DateTime.now()).inDays > 0;
    }
  }

  getTrialTimeLeft() {
    return _trailEndTime.difference(DateTime.now()).inDays;
  }

  setActive() {
    _isActive = true;
  }

  get isActive => _isActive;

  get inTrial => _inTrial;

  Map<String, dynamic> toJSON() {
    return {
      "inTrial": _inTrial,
      "isActive": _isActive,
      "trialEndTime": _trailEndTime.toIso8601String(),
      "purchaseInfo": _customerInfo.toJson(),
    };
  }

// Singleton boilerplate
  Subscription({logInResults = LogInResult}) {
    _newAccount = logInResults.created;
    if (_newAccount) {
      _trailEndTime = DateTime.now().add(Duration(days: 7));
    } else {
      // TODO: fetch trailendtime from firebase
    }
    setCustomerInfo(logInResults.customerInfo);
    if (customerInfo?.firstSeen?.isNotEmpty ?? false) {
      _isActive =
          customerInfo?.entitlements?.all['premium_user']?.isActive ?? false;
    }
  }
}
