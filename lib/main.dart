import 'dart:developer' as dev;

import 'package:firebase_core/firebase_core.dart';
import 'package:power_of_one_basketball/Services/FeatureFlagService/feature_flag_service.dart';
import 'firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:power_of_one_basketball/Objects/PO1Score.dart';
import 'package:power_of_one_basketball/Services/RevenueCat/revenue_cat_service.dart';
import 'package:power_of_one_basketball/Services/authentication_service.dart';
import 'package:power_of_one_basketball/Services/core_services.dart';
import 'package:power_of_one_basketball/Views/FeedBack/FeedBack.dart';
import 'package:power_of_one_basketball/Views/Login/LoginForm.dart';
import 'package:power_of_one_basketball/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_of_one_basketball/Views/Register/register.dart';
import 'package:power_of_one_basketball/Views/ReportCard/ReportCard.dart';
import 'package:power_of_one_basketball/Views/ScoreCard/ScoreCard.dart';
import 'package:power_of_one_basketball/Views/TermsAndConditions/TermsAndConditions.dart';

import 'models/PO1User.dart';
import 'Views/Purchase_Screen/purchase.screen.dart';
// import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await RevenueCatService().init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
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
        ChangeNotifierProvider<PlayerOrTeamService>(
          create: (BuildContext create) => PlayerOrTeamService(),
        ),
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
          initialData: null,
        ),
        ChangeNotifierProvider<FeatureFlagService>(
          create: (_) => FeatureFlagService()..initialize(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Power of 1 Basketball',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff33333D),
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Color(0xff33333D),
          ),
          dialogTheme: DialogThemeData(backgroundColor: Color(0xff33333D)),
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
        // home: PurchaseScreen(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? firebaseUser = context.watch<User?>();
    // final RevenueCatService _purchaseService =
    //     context.read<RevenueCatService>();

    if (firebaseUser != null) {
      dev.log('Found user in Firebase: $firebaseUser');
      PO1User().firebaseInit(fbUser: firebaseUser);
      return PlayerNameForm();
    }
    dev.log('No user found in Firebase');
    return LoginFormScreen();
  }
}
