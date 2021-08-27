import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

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

  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String> login({String email, String password}) async {
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
      return e.message;
    }
  }

  Future<String> register({String email, String password}) async {
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
      print('The error is ${e.message}');
      return e.message;
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

  Future<String> loginWithEmailLink({String email}) async {
    try {
      await _firebaseAuth.signInWithEmailLink(email: email, emailLink: email);
      return 'login succesful';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

// TODO1: create a forgot password function that follows this functionality (https://firebase.google.com/docs/auth/web/manage-users#send_a_password_reset_email)
  Future<String> sendPasswordResetFor({String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return 'email link sent';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
