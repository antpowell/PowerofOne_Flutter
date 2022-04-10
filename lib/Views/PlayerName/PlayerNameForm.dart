import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Main.dart';
import 'package:power_one/Models/PO1PlayerSkill.dart';
import 'package:power_one/Services/authentication_service.dart';
import 'package:power_one/Services/database_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/ScoreCard/ScoreCard.dart';
import 'package:power_one/Models/PO1User.dart';
import 'package:provider/provider.dart';

class PlayerNameForm extends StatefulWidget {
  PlayerNameForm({Key key}) : super(key: key);
  static final String id = 'player_name_screen';

  @override
  _PlayerNameFormState createState() => _PlayerNameFormState();
}

class _PlayerNameFormState extends State<PlayerNameForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double pageMargin = 24;
  static final PO1User _user = PO1User();
  static final fbdbService = FBDBService();

  Widget _buildNameField() {
    return TextFormField(
      obscureText: false,
      decoration: InputDecoration(
        border: InputBorder.none,
        // hintText: "What's your athlete's name?",
        hintText: "What's the name of your athlete?",
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        // labelText: "Player Name",
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

  List<bool> _selections =
      List.generate(PO1PlayerSkill.values.length, (_) => false);

  Widget _buildToggleSection() {
    List<Widget> _toggleList = [];
    PO1PlayerSkill.values.forEach((e) => {
          _toggleList.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                describeEnum(e).toUpperCase(),
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          )
        });
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Center(
            child: Text("Select your player's level",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ))),
      ),
      Center(
        child: ToggleButtons(
          children: _toggleList,
          isSelected: _selections,
          onPressed: (int index) {
            setState(() {
              _selections =
                  List.generate(PO1PlayerSkill.values.length, (_) => false);
              _selections[index] = !_selections[index];
              _user.playerSkill = PO1PlayerSkill.values.elementAt(index);
            });
          },
          color: Colors.blueAccent,
          selectedColor: Colors.orangeAccent,
          fillColor: Colors.deepPurpleAccent,
          selectedBorderColor: Colors.white,
          borderColor: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ]);
  }

  Widget _buildHeader() {
    return Text(
      "Player Name",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 58),
    );
  }

  Widget _buildButtonGroup() {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Flexible(
          flex: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              /**
               * !!Dev only - hide until previouse game history work is done
               */
              // PO1Button(
              //   "Recent Game",
              //   onPress: () {
              //     Dialogs.okDialogAction(
              //       context,
              //       '⚠',
              //       'Feature Under Construction',
              //     );
              //   },
              // ),
              // !! DEV only

              Container(
                child: MaterialButton(
                  onPressed: () async {
                    Provider.of<AuthenticationService>(
                      context,
                      listen: false,
                    ).signOut();
                    Navigator.pushAndRemoveUntil(
                        // user AuthWrapper in stead of LoginForm
                        context,
                        MaterialPageRoute(builder: (builder) => AuthWrapper()),
                        (route) => false);
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              PO1Button(
                "Start Game",
                onPress: () {
                  debugPrint(
                    'User pressed Start Game button, save the player name to the user and take them to the score card view.',
                  );
                  if (!_formKey.currentState.validate() ||
                      _user.playerSkill == null) {
                    return;
                  }
                  _formKey.currentState.save();
                  dev.log('current user ${_user.email}');
                  fbdbService.createNewUser(_user);
                  /* if(_user.hasSubscription){
                    Navigator.pushNamed(context, SubscriptionScreen.id);
                  }else{ */
                  Navigator.pushNamed(context, ScoreCard.id);
                  /* } */
                },
              ),
            ],
          ),
        ),
      ],
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
                      _buildToggleSection(),
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
