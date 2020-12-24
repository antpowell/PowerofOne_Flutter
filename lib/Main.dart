import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:power_one/Services/authentication_service.dart';
import 'package:power_one/Views/Help/helpPage.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Views/LoginSignUp/SigninSignup.dart';
import 'package:power_one/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_one/Views/Register/register.dart';
import 'package:power_one/Views/ReportCard/ReportCard.dart';
import 'package:power_one/Views/ScoreCard/ScoreCard.dart';
import 'package:power_one/Views/SignIn/SignUpForm.dart';
import 'package:power_one/models/PO1User.dart';
import 'package:power_one/Views/TermsAndConditions/TermsAndConditions.dart';
import 'package:power_one/Views/FeedBack/FeedBack.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as dev;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(Power1());
}

class Power1 extends StatelessWidget {
  PO1User _user = PO1User();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PO1Score>(
          create: (BuildContext context) => PO1Score(),
        ),
        Provider<AuthenticationService>(
          create: (BuildContext context) =>
              AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChange,
        ),
      ],
      child: MaterialApp(
        title: 'Power of 1 Basketball',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff33333D),
          dialogBackgroundColor: Color(0xff33333D),
          backgroundColor: Color(0xff33333D),
        ),
        // initialRoute: '/',
        routes: {
          SignInUpFormScreen.id: (context) => SignInUpFormScreen(),
          Register.id: (context) => Register(),
          ReportCard.id: (context) => ReportCard(),
          '/register': (context) => SigninSignup(),
          PlayerNameForm.id: (context) => PlayerNameForm(),
          ScoreCard.id: (context) => ScoreCard(),
          '/termsAndConditions': (context) => TermsAndConditions(),
          TermsAndConditions.id: (context) => TermsAndConditions(),
          FeedBack.id: (context) => FeedBack(),
          '/Help': (context) => HelpPage(),
        },
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      dev.log('Found user in Firebase: $firebaseUser');
      PO1User().setEmail(firebaseUser.email);
      return PlayerNameForm();
    }
    dev.log('No user found in Firebase');
    return SignInUpFormScreen();
  }
}
