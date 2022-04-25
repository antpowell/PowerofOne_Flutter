import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:power_one/Services/RevenueCat/revenue_cat_service.dart';
import 'package:power_one/Services/authentication_service.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Views/Login/LoginForm.dart';
import 'package:power_one/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_one/Views/Register/register.dart';
import 'package:power_one/Views/ReportCard/ReportCard.dart';
import 'package:power_one/Views/ScoreCard/ScoreCard.dart';
import 'package:power_one/Views/TermsAndConditions/TermsAndConditions.dart';
import 'package:power_one/Views/FeedBack/FeedBack.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as dev;

import 'Models/PO1User.dart';
import 'Views/Purchase_Screen/purchase.screen.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // RevenueCatService.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(Power1());
}

class Power1 extends StatelessWidget {
  // PO1User _user = PO1User();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<SubscriptionPurchase>(
        //   create: (context) => SubscriptionPurchase(
        //     context.read<SubscriptionPurchase>(),
        //   ),
        //   lazy: false,
        // ),
        ChangeNotifierProvider<PO1Score>(
          create: (BuildContext context) => PO1Score(),
        ),
        Provider<AuthenticationService>(
          create: (BuildContext context) =>
              AuthenticationService(FirebaseAuth.instance),
        ),
        Provider<RevenueCatService>(
          create: (BuildContext context) => RevenueCatService(),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChange,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Power of 1 Basketball',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff33333D),
          dialogBackgroundColor: Color(0xff33333D),
          backgroundColor: Color(0xff33333D),
        ),
        // initialRoute: '/',
        routes: {
          LoginFormScreen.id: (context) => LoginFormScreen(),
          Register.id: (context) => Register(),
          ReportCard.id: (context) => ReportCard(),
          PlayerNameForm.id: (context) => PlayerNameForm(),
          ScoreCard.id: (context) => ScoreCard(),
          PurchaseScreen.id: ((context) => PurchaseScreen()),
          TermsAndConditions.id: (context) => TermsAndConditions(),
          FeedBack.id: (context) => FeedBack(),
          // '/Help': (context) => HelpPage(),
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
    // final RevenueCatService _purchaseService =
    //     context.read<RevenueCatService>();

    if (firebaseUser != null) {
      dev.log('Found user in Firebase: $firebaseUser');
      PO1User().firebaseInit(firebaseUser.email, firebaseUser.uid);
      // PO1User().setEmail(firebaseUser.email);
      // PO1User().setId(firebaseUser.uid);
      return PlayerNameForm();
    }
    dev.log('No user found in Firebase');
    return LoginFormScreen();
  }
}
