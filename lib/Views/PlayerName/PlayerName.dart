import 'package:flutter/material.dart';
import 'package:power_one/InputArea.dart';

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
                // decoration: BoxDecoration(
                //   border: Border(
                //     bottom:BorderSide(
                //       color: Colors.grey[100],
                //     ),
                //   ),
                // ),
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
                    style: TextStyle(fontSize: 24),
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
                    MaterialButton(
                        onPressed: () {
                          debugPrint(
                              'User pressed Recent Games button, show them the summary of the last 3 games they have soaved.');
                        },
                        child: Text(
                          'Recent Games',
                          style: TextStyle(color: Colors.white),
                        )),
                    MaterialButton(
                      color: Color(0xff070707),
                      elevation: 9,
                      onPressed: () {
                        debugPrint(
                            'User pressed Start Game button, save the player name to the user and take them to the score card view.');
                        Navigator.pushNamed(context, '/scoreCard');
                      },
                      textColor: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Start Game",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
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
