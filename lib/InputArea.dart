import 'package:flutter/material.dart';
import 'package:power_one/models/PO1User.dart';

class InputArea extends StatefulWidget {
  InputArea({Key key}) : super(key: key);
  final TextEditingController emailTxtFieldController =
          new TextEditingController(),
      pwdTxtFieldController = new TextEditingController();

  @override
  _InputAreaState createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  final TextEditingController emailTxtFieldController =
          new TextEditingController(),
      pwdTxtFieldController = new TextEditingController();
  String email = "", password = "";
  bool hasEmail = false, hasPassword = false;
  RegExp emailExp = RegExp(r"^$|^.*@.*\..*$");
  RegExp passwordExp = RegExp(r'^.*(?=.{8,}).*$');

  validateField(String fieldText, String type) {
    switch (type) {
      case 'email':
        setState(() {
          hasEmail = emailExp.hasMatch(fieldText);
          if (hasEmail) {
            email = fieldText;
            debugPrint(email);
          }
        });
        break;
      case 'password':
        setState(() {
          hasPassword = passwordExp.hasMatch(fieldText);
          password = fieldText;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: emailTxtFieldController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (text) {
            validateField(text, 'email');
          },
          obscureText: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            // hintText: 'Email',
            labelText: 'Email',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            errorText: hasEmail ? null : "Please enter email",
          ),
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Container(
          height: 24,
        ),
        TextField(
          controller: pwdTxtFieldController,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (text) {
            validateField(text, 'password');
          },
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Password',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            errorText: hasPassword ? null : "Please enter valid password",
          ),
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
