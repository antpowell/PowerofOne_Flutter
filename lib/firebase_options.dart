// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-IvG4dUbeoe21la4C9ZFdGs21pjFEt6A',
    appId: '1:856529158202:android:bf8d89e4cfd5d835047503',
    messagingSenderId: '856529158202',
    projectId: 'powerof1',
    databaseURL: 'https://powerof1.firebaseio.com',
    storageBucket: 'powerof1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApQ_K4WKYddFuK7rv9liUqEdICYeXGdvY',
    appId: '1:856529158202:ios:8964a554a5756af7047503',
    messagingSenderId: '856529158202',
    projectId: 'powerof1',
    databaseURL: 'https://powerof1.firebaseio.com',
    storageBucket: 'powerof1.appspot.com',
    iosClientId: '856529158202-nnk8vhmj2g0ui1q92ls1hbvl3en44cjt.apps.googleusercontent.com',
    iosBundleId: 'com.powerofone.basketbal',
  );
}