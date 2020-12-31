import 'package:flutter/material.dart';
import 'package:power_one/InputArea.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Services/authentication_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/models/PO1User.dart';
import 'package:provider/provider.dart';
import 'package:power_one/Views/ScoreCard/ScoreCard.dart';

class PlayerNameScene extends StatelessWidget {
  PO1User _user;
  String _palyerName;

  static const _formStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 58);

  Widget _buildPlayerName() {
    return TextFormField(
      style: _formStyle,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'PlayerName',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Player Name is required';
        }
        return null;
      },
      onSaved: (String newValue) {
        _palyerName = newValue;
      },
    );
  }

  Widget _buildPlayerNameForm() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            _buildPlayerName()
          ],
        ),
      ),
    );
  }

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
                        // FIXME: Testing ONLY
                        // Navigator.pushNamed(context, '/reportCard');
                        Provider.of<AuthenticationService>(context,
                                listen: false)
                            .signOut();
                      },
                      child: Text(
                        'Recent Games',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    PO1Button("Start Game", onPress: () {
                      debugPrint(
                          'User pressed Start Game button, save the player name to the user and take them to the score card view.');
                      // PO1Score().assignUser();
                      Navigator.pushNamed(context, ScoreCard.id,);
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
