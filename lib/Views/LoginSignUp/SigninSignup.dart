import 'package:flutter/material.dart';
import 'package:power_one/InputArea.dart';
import 'package:power_one/models/PO1User.dart';

class SigninSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                child: Image.asset(
                  "assets/images/POWER_OF_1_SPORT_LO-FF.png",
                  colorBlendMode: BlendMode.clear,
                  width: 260,
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: InputArea(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    child: Text(
                      'New User? Sign Up!',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    onPressed: () => {
                      // TODO: Register and create new user [maybe just an Alert]
                      Navigator.pushNamed(context, '/register'),
                      debugPrint('New user, needs to register.'),
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    onPressed: () {
                      // TODO: Forgot password trigger [maybe just an Alert
                      debugPrint(
                          'User forgot password and is trying to reset.');
                      debugPrint(
                          'InputArea Data ${InputArea().emailTxtFieldController.text}');
                      PO1User currUser = PO1User();
                      debugPrint("new current user, ${currUser.email}");
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    color: Colors.white,
                    iconSize: 25,
                    onPressed: () {
                      // TODO: Check if InputArea() is valid before progressing.
                      Navigator.pushNamed(context, '/playerName');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// bool inputValidator() => {
// return false;
// }
