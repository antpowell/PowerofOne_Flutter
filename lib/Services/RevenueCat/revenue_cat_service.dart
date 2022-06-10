import 'dart:developer';

import 'package:power_one/Models/PO1User.dart';
import 'package:power_one/models/PO1Subscription.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:io' show Platform;
import 'dart:developer' as dev;

class RevenueCatService {
  // TestAccount
  // static const _google_public_api_key = 'goog_TnZHYBscmYDjIySJUGXHhMzkYpR';
  // static const _ios_public_api_key = 'appl_zRTNbkRllszZkurUlFKezAmVuyX';
  // PO1Account
  static const _google_public_api_key = 'goog_AloFDTYYeUKNcZpVQtfojuKkHqy';
  static const _ios_public_api_key = 'appl_yGdGIHEHeZTRhgzVhGpWfgnMloQ';

  static LogInResult _logInResult;
  static LogInResult get logInResult => _logInResult;

  Future init(/*TODO: String userId */) async {
    await Purchases.setDebugLogsEnabled(true);
    if (Platform.isAndroid) {
      await Purchases.setup(
          _google_public_api_key /*TODO: , appUserId: userId */);
    } else if (Platform.isIOS) {
      await Purchases.setup(_ios_public_api_key /*TODO: , appUserId: userId */);
    }
  }

  RevenueCatService() {
    init();
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final Offerings offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        log(offerings.toString());
      }
      final Offering current = offerings.current;

      return current == null ? [] : [current];
    } on Exception catch (e) {
      dev.log('Purchase fetchOffers call failed with $e');
      return [];
    }
  }

  static Future<LogInResult> logIn(String userId) async {
    try {
      // TODO: fix login here
      // await init(userId);
      // _logInResult = await Purchases.restoreTransactions();
      _logInResult = await Purchases.logIn(userId);
      return _logInResult;
    } catch (e) {
      dev.log('RC login failed with $e');
      return null;
    }
  }

// update subscriber attributes https://docs.revenuecat.com/docs/subscriber-attributes
  static Future<void> updateAccount(Map<String, dynamic> args) async{
    // Examples:
    // Purchases.setEmail("test@example.com");
    // Purchases.setPhoneNumber("+16505551234");
    // Purchases.setDisplayName("John Appleseed");
    // Purchases.setAttributes({"age": "24", "custom_group_id": "abc123"});
    await Purchases.setAttributes(args);
  }

  static Future<void> delete(String: attributeName){}
}



// Future fetchOffers() async {
//   final offers = await InnAppPurchaseService.
// }
