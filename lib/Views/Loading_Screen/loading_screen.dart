import 'package:flutter/material.dart';
import 'package:power_one/Views/Help/helpPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:power_one/Views/ReportCard/ReportCard.dart';

class Loadingscreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinKit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: SafeArea(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
