import 'package:flutter/material.dart';
import 'package:power_one/InputArea.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/models/User.dart';

class PlayerNameScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: Text(
                    "Player Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 58),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: Center(
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Player Name",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    PO1Button(
                      "Recent Games",
                      onPress: () => {},
                    ),
                    MaterialButton(
                      onPressed: () {
                        debugPrint(
                            'User pressed Recent Games button, show them the summary of the last 3 games they have soaved.');
                        Navigator.pushNamed(context, '/reportCard');
                      },
                      child: Text(
                        'Recent Games',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    PO1Button("Start Game", onPress: () {
                      debugPrint(
                          'User pressed Start Game button, save the player name to the user and take them to the score card view.');
                      PO1Score().assignUser(
                          User('email', playerName: 'Player Name2'));
                      Navigator.pushNamed(context, '/scoreCard');
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
