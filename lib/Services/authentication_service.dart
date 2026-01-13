import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:power_of_one_basketball/Services/RevenueCat/revenue_cat_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

enum authProblems {
  UserNotFound,
  PasswordNotValid,
  NetworkError,
  WeakPasswordError,
  EmailInUseError,
}

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await setDevGroup();
      // await revenueCatLogin();

      return '$email signed in';
    } on FirebaseAuthException catch (e) {
      late authProblems errorType;
      if (Platform.isAndroid) {
        switch (e.message) {
          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
            errorType = authProblems.UserNotFound;
            break;
          case 'The password is invalid or the user does not have a password.':
            errorType = authProblems.PasswordNotValid;
            break;
          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
            errorType = authProblems.NetworkError;
            break;
          case 'weak.password':
            errorType = authProblems.WeakPasswordError;
            break;
          case 'email-already-in-use':
            errorType = authProblems.EmailInUseError;
            break;

          default:
            // log error in telemetry when added
            print('AUTH ERROR CASE NOT IMPLEMENTED FOR ------> ${e.message}');
        }
      } else if (Platform.isIOS) {
        switch (e.code) {
          case 'user-not-found':
            errorType = authProblems.UserNotFound;
            break;
          case 'invalid-password':
            errorType = authProblems.PasswordNotValid;
            break;
          case 'Error 17020':
            errorType = authProblems.NetworkError;
            break;
          default:
            print('AUTH ERROR CASE NOT IMPLEMENTED FOR ------> ${e.message}');
        }
      }
      // log error in telemetry when added
      print('The error is $errorType');
      return e.message ?? '';
    }
  }

  Future<String?> register({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await revenueCatLogin();

      return '$email account created';
    } on FirebaseAuthException catch (e) {
      authProblems
      /// The `errorType` variable in the `AuthenticationService` class is used to determine the specific type
      /// of authentication problem that occurred during the login or registration process. It is an enum type
      /// `authProblems` that defines different types of authentication issues such as UserNotFound,
      /// PasswordNotValid, NetworkError, WeakPasswordError, and EmailInUseError.
      errorType;
      if (Platform.isAndroid) {
        switch (e.message) {
          case ' The email address is already in use by another account.':
            errorType = authProblems.EmailInUseError;
            break;
          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
            errorType = authProblems.NetworkError;
            break;
          case 'Password should be at least 6 characters':
            errorType = authProblems.WeakPasswordError;
            break;

          default:
            print('Case ${e.message} is not yet implemented');
        }
      } else if (Platform.isIOS) {
        switch (e.code) {
          case 'Error 17011':
            errorType = authProblems.UserNotFound;
            break;
          case 'Error 17009':
            errorType = authProblems.PasswordNotValid;
            break;
          case 'Error 17020':
            errorType = authProblems.NetworkError;
            break;
          default:
            print('Case ${e.message} is not yet implemented');
        }
      }
      print('Unable to register user.\nmessage: ${e.message}');
      return e.message;
    }
  }

  Future<String?> signOut() async {
    String? email = _firebaseAuth.currentUser?.email;
    try {
      await _firebaseAuth.signOut();
      await removeDevGroup();

      return '$email signed out';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> loginWithEmailLink({required String email}) async {
    try {
      await _firebaseAuth.signInWithEmailLink(email: email, emailLink: email);
      await setDevGroup();
      // await revenueCatLogin();

      return 'login successful';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // TODO1: create a forgot password function that follows this functionality (https://firebase.google.com/docs/auth/web/manage-users#send_a_password_reset_email)
  Future<String?> sendPasswordResetFor({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return 'email link sent';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<LogInResult?> revenueCatLogin() async {
    try {
      User? fbUser = _firebaseAuth.currentUser;
      late LogInResult? results;
      if (fbUser != null) {
        results = await RevenueCatService.logIn(fbUser);
      }
      if (results != null && results.created) {
        /// true if the logged in user has been created in the
        /// RevenueCat backend for the first time
        /// (i.e. they have not yet purchased a subscription)
      }
      return results;
    } catch (e) {
      print('Error logging in to RevenueCat: $e');
    }
    return null;
  }

  Future<void> setDevGroup() async {
    User? user = _firebaseAuth.currentUser;

    if (user != null) {
      await FirebaseAnalytics.instance.setUserId(id: user.uid);
      await FirebaseAnalytics.instance.setUserProperty(
        name: 'dev_group',
        value: user.uid,
      );
    }
  }

  Future<void> removeDevGroup() async {
    User? user = _firebaseAuth.currentUser;

    if (user != null) {
      await FirebaseAnalytics.instance.setUserId(
        id:
            /// In the provided Dart code snippet, `user.uid` is used to access the
            /// unique identifier (UID) of the currently authenticated user in
            /// Firebase Authentication.
            user.uid,
      );
      await FirebaseAnalytics.instance.setUserProperty(
        name: 'dev_group',
        value: null,
      );
    }
  }
}
