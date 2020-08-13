import 'package:flutter/material.dart';

class InputArea extends StatefulWidget {
  InputArea({Key key}) : super(key: key);

  @override
  _InputAreaState createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  String email = "", password = "";
  bool hasEmail = false, hasPassword = false;
  RegExp emailExp = RegExp(r"^$|^.*@.*\..*$");
  RegExp passwordExp = RegExp(r'^.*(?=.{8,}).*$');

  validateField(String fieldText, String type) {
    switch (type) {
      case 'email':
        setState(() {
          hasEmail = emailExp.hasMatch(fieldText);
        });
        break;
      case 'password':
        setState(() {
          hasPassword = passwordExp.hasMatch(fieldText);
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
          onChanged: (text) {
            validateField(text, 'email');
            debugPrint(text);
            email = text;
          },
          obscureText: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            // hintText: 'Email',
            labelText: 'Email',
            labelStyle: TextStyle(),
            errorText: hasEmail ? null : "Please enter email",
          ),
        ),
        Container(
          height: 24,
        ),
        TextField(
          onChanged: (text) {
            validateField(text, 'password');
            debugPrint(text);
            password = text;
          },
          obscureText: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Password',
              errorText: hasPassword ? null : "Please enter valid password"),
        ),
      ],
    );
  }
}
