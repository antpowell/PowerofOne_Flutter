import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';

class PlayerNameForm extends StatefulWidget {
  PlayerNameForm({Key key}) : super(key: key);

  @override
  _PlayerNameFormState createState() => _PlayerNameFormState();
}

class _PlayerNameFormState extends State<PlayerNameForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      obscureText: false,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Player Name",
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        // labelText: "PlayerName",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      "Player Name",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 58),
    );
  }

  Widget _buildButtonGroup() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PO1Button(
            "Recent Games",
            onPress: () => {},
          ),
          MaterialButton(
            onPressed: () => {
              debugPrint(
                  'User pressed Recent Games button, show them the summary of the last 3 games they have soaved.'),
              Navigator.pushNamed(context, '/reportCard'),
            },
            child: Text(
              'Recent Games',
              style: TextStyle(color: Colors.white),
            ),
          ),
          PO1Button(
            "Start Game",
            onPress: () => {
              debugPrint(
                  'User pressed Start Game button, save the player name to the user and take them to the score card view.'),
              // PO1Score().assignUser();
              Navigator.pushNamed(context, '/scoreCard'),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 120),
            _buildNameField(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildForm(),
                _buildButtonGroup(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
