import 'dart:ui';
import 'dart:developer' as dev;
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/models/User.dart';

class PlayerNameForm extends StatefulWidget {
  PlayerNameForm({Key key}) : super(key: key);

  @override
  _PlayerNameFormState createState() => _PlayerNameFormState();
}

class _PlayerNameFormState extends State<PlayerNameForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double pageMargin = 24;
  static final User _user = User();

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
      validator: (value) {
        if (value.isEmpty) {
          return 'Player Name is required';
        }
        return null;
      },
      onSaved: (String newValue) {
        dev.log(newValue);
        _user.setPlayerName(newValue);
      },
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
            onPress: () {
              debugPrint(
                  'User pressed Start Game button, save the player name to the user and take them to the score card view.');
              if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
              Navigator.pushNamed(context, '/scoreCard');
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
            _buildNameField(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(pageMargin),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - (pageMargin * 2)),
                child: Form(
                  key: _formKey,
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildHeader(),
                      _buildForm(),
                      _buildButtonGroup(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
