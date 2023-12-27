import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import 'package:flutter/foundation.dart';

class IAPConnection {
  /// We want singelton object of ``PaymentService`` so create private constructor
  ///
  /// Use PaymentService as ``PaymentService.instance``
  static late InAppPurchase _instance;
  static set instance(InAppPurchase value) {
    _instance = value;
  }

  static InAppPurchase get instance {
    _instance ??= InAppPurchase.instance;
    return _instance;
  }

  // static final PaymentService? instance;

  // /// Listener of the connection status between the app and the billing server
  // StreamSubscription<ConnectionResult> _connectionSubscription;

  // /// To listen the status of the purchase made inside or outside of the app (App Store / Play Store)
  // ///
  // /// If status is not error then app will be notied by this stream
  // ///
  // /// Listener for the purchase status of purchases made insider or outside of the app (App Store / Play Store)
  // StreamSubscription<PurchasedItem> _purchaseUpdatedSubscription;

  // /// Listener for purchase subscription errors
  // StreamSubscription<PurchaseResult> _purchaseErrorSubscription;

  // /// List of product ids to fetch
  // final List<String> _productIds = ['monthly_subscription'];

  // /// All available products will be store in this list
  // List<IAPItem> _products;

  // /// All past purchases will be store in this list
  // List<PurchasedItem> _pastPurchases;

  /// view of the app will subscribe to this to get notified
  /// when premium status of the user changes
  ObserverList<Function> _proStatusChangedListeners =
      new ObserverList<Function>();

  /// view of the app will subscribe to this to get errors of the purchase
  ObserverList<Function> _errorListeners =
      new ObserverList<Function>();

  /// logged in user's premium status
  bool _isProUser = false;

  bool get isProUser => _isProUser;

  /// view can subscribe to _proStatusChangedListeners using this method
  addToProStatusChangedListeners(Function callback) {
    _proStatusChangedListeners.add(callback);
  }

  /// view can cancel to _proStatusChangedListeners using this method
  removeFromProStatusChangedListeners(Function callback) {
    _proStatusChangedListeners.remove(callback);
  }

  /// view can subscribe to _errorListeners using this method
  addToErrorListeners(Function callback) {
    _errorListeners.add(callback);
  }

  /// view can cancel to _errorListeners using this method
  removeFromErrorListeners(Function callback) {
    _errorListeners.remove(callback);
  }

  /// Call this method to notify all the subsctibers of _proStatusChangedListeners
  void _callProStatusChangedListeners() {
    _proStatusChangedListeners.forEach((Function callback) {
      callback();
    });
  }

  /// Call this method to notify all the subsctibers of _errorListeners
  void _callErrorListeners(String error) {
    _errorListeners.forEach((Function callback) {
      callback(error);
    });
  }

  // /// Call this method at the startup of you app to initialize connection
  // /// with billing server and get all the necessary data
  // void initConnection() async {
  //   await FlutterInappPurchase.instance.initConnection;
  //   _connectionSubscription =
  //       FlutterInappPurchase.connectionUpdated.listen((connected) {});

  //   _purchaseUpdatedSubscription =
  //       FlutterInappPurchase.purchaseUpdated.listen(_handlePurchaseUpdate);

  //   _purchaseErrorSubscription =
  //       FlutterInappPurchase.purchaseError.listen(_handlePurchaseError);

  //   _getItems();
  //   _getPastPurchases();
  // }

  // /// call when user close the app
  // void dispose() {
  //   _connectionSubscription.cancel();
  //   _purchaseErrorSubscription.cancel();
  //   _purchaseUpdatedSubscription.cancel();
  //   FlutterInappPurchase.instance.endConnection;
  // }
}
