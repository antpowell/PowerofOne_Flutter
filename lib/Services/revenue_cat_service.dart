import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:io' show Platform;
import 'dart:developer' as dev;

class InnAppPurchaseService {
  static const _google_public_api_key = 'goog_TnZHYBscmYDjIySJUGXHhMzkYpR';
  static const _ios_public_api_key = 'appl_zRTNbkRllszZkurUlFKezAmVuyX';

  static Future init() async {
    await Purchases.setDebugLogsEnabled(true);
    if (Platform.isAndroid) {
      await Purchases.setup(_google_public_api_key);
    } else if (Platform.isIOS) {
      await Purchases.setup(_ios_public_api_key);
    }
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
}

// Future fetchOffers() async {
//   final offers = await InnAppPurchaseService.
// }
