import 'package:power_one/Models/PO1User.dart';
import 'package:power_one/models/PO1Subscription.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:io' show Platform;
import 'dart:developer' as dev;

class RevenueCatService {
  static const _google_public_api_key = 'goog_TnZHYBscmYDjIySJUGXHhMzkYpR';
  static const _ios_public_api_key = 'appl_zRTNbkRllszZkurUlFKezAmVuyX';

  static LogInResult _logInResult;
  static LogInResult get logInResult => _logInResult;

  Future init() async {
    await Purchases.setDebugLogsEnabled(true);
    if (Platform.isAndroid) {
      await Purchases.setup(_google_public_api_key);
    } else if (Platform.isIOS) {
      await Purchases.setup(_ios_public_api_key);
    }
  }

  RevenueCatService() {
    init();
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final Offerings offerings = await Purchases.getOfferings();
      final Offering current = offerings.current;

      return current == null ? [] : [current];
    } on Exception catch (e) {
      dev.log('Purchase fetchOffers call failed with $e');
      return [];
    }
  }

  static Future<Subscription> fetchSubscription(PO1User user) async {
    // try {
    //   final LogInResult logInResult = await Purchases.logIn(user.id);
    //   // return logInResult;
    // } catch (e) {
    //   dev.log('RC login failed with $e');
    //   return null;
    // }
  }

  Future<LogInResult> logIn(String userId) async {
    try {
      _logInResult = await Purchases.logIn(userId);
      return _logInResult;
    } catch (e) {
      dev.log('RC login failed with $e');
      return null;
    }
  }
}



// Future fetchOffers() async {
//   final offers = await InnAppPurchaseService.
// }
