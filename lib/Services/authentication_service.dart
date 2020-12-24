import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as dev;

import 'package:power_one/Views/dialogs.dart';

enum authProblems {
  UserNotFound,
  PasswordNotValid,
  NetworkError,
  WeakPasswordError,
  EmailInUseError
}

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return '$email signed in';
    } on FirebaseAuthException catch (e) {
      authProblems errorType;
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

      print('The error is $errorType');
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return '$email account created';
    } on FirebaseAuthException catch (e) {
      authProblems errorType;
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
      print('The error is $errorType');
    }
  }

  Future<String> signOut() async {
    String email = _firebaseAuth.currentUser.email;
    try {
      await _firebaseAuth.signOut();
      return '$email signed out';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
