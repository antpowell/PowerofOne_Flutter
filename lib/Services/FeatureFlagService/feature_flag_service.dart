import 'dart:developer' as dev;

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class FeatureFlagService extends ChangeNotifier {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  bool get maintenanceMode => _remoteConfig.getBool('maintenanceMode');

  Future<void> initialize() async {
    try {
      // 1. Set the polling interval (how often to check for updates)
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(
            hours: 0,
          ), // Use 0 for development!
        ),
      );

      // 2. Set default values (Crucial for offline or first-run)
      await _remoteConfig.setDefaults(const {
        "show_new_success_screen": false,
        "maintenanceMode": false,
      });

      // 3. Fetch and activate
      await _remoteConfig.fetchAndActivate();

      _remoteConfig.onConfigUpdated.listen((event) async {
        await _remoteConfig.activate();
        notifyListeners();
      });

      notifyListeners();
      // Helper method to read the flag
    } catch (e) {
      debugPrint("Feature Flag Error: $e");
      dev.log("Feature Flag Error: $e");
    }
  }
}
