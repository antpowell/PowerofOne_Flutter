import 'dart:developer' as dev;

import 'package:purchases_flutter/purchases_flutter.dart';

class Subscription {
  static bool _newAccount = false;
  static late DateTime _trailEndTime;
  bool _isActive = false, _inTrial = true;

  late CustomerInfo _customerInfo;
  CustomerInfo get customerInfo => _customerInfo;
  setCustomerInfo(CustomerInfo customerInfo) {
    _customerInfo = customerInfo;
    // if (_customerInfo != null ||
    //     _customerInfo.entitlements != null ||
    //     _customerInfo.entitlements.all != null ||
    //     _customerInfo.entitlements.all.isEmpty) {
    //   dev.log("ALL: ----> ${_customerInfo?.entitlements?.all.toString()}");
    //   dev.log(
    //       "ALL: ----> ${_customerInfo?.entitlements?.all['premium_user'].toString()}");
    // }
    if (_customerInfo.entitlements.all['premium_user']?.isActive ?? false) {
      setActive();
    }
    // TODO: Identify what needs to be used to determine if the user has a trial/subscription
  }

  Future<bool> restoreCustomerInfo() async {
    CustomerInfo restoredCustomerInfo;
    try {
      restoredCustomerInfo = await Purchases.restorePurchases();
      setCustomerInfo(restoredCustomerInfo);
      return true;
    } catch (e) {
      dev.log('failed to restore customer purchase with error $e');
      return false;
    }
  }

  updateCustomerSubscriptionPersonalInfo() {}

  setTrialEndTime({DateTime? creationTime}) {
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
      // TODO: fetch trailEndTime from firebase
    }

    setCustomerInfo(logInResults.customerInfo);
    if (customerInfo.firstSeen.isNotEmpty) {
      _isActive =
          customerInfo.entitlements.all['premium_user']?.isActive ?? false;
    }
  }
}
