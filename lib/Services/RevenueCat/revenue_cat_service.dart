import 'dart:developer';
import 'dart:developer' as dev;
import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

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
    await Purchases.setLogLevel(LogLevel.verbose);
    if (Platform.isAndroid) {
      await Purchases.configure(
        new PurchasesConfiguration(
            _google_public_api_key /*TODO: , appUserId: userId */),
      );
    } else if (Platform.isIOS) {
      await Purchases.configure(
        new PurchasesConfiguration(
            _ios_public_api_key /*TODO: , appUserId: userId */),
      );
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

  static Future<LogInResult> logIn(User user) async {
    try {
      _logInResult = await Purchases.logIn(user.uid);
      setEmail(user.email);

      return _logInResult;
    } catch (e) {
      dev.log('RC login failed with $e');
      return null;
    }
  }

  static Future<void> restorePurchases() async {
    try {
      await Purchases.restorePurchases();
    } catch (e) {
      dev.log('Could not restore purchase: $e');
    }
  }

  static Future<void> setEmail(String email) async {
    try {
      await Purchases.setEmail(email);
    } catch (e) {
      dev.log('Failed to set email: $e');
      return null;
    }
  }

  static Future<void> setFirebaseAppInstanceId(
      String firebaseAppInstance) async {
    try {
      await Purchases.setFirebaseAppInstanceId(firebaseAppInstance);
    } catch (e) {
      dev.log('Failed to set firebase app instance id: $e');
      return null;
    }
  }

// update subscriber attributes https://docs.revenuecat.com/docs/subscriber-attributes
  static Future<void> updateAccount(Map<String, dynamic> args) async {
    // Examples:
    // Purchases.setEmail("test@example.com");
    // Purchases.setPhoneNumber("+16505551234");
    // Purchases.setDisplayName("John Appleseed");
    // Purchases.setAttributes({"age": "24", "custom_group_id": "abc123"});
    await Purchases.setAttributes(args);
  }
}
