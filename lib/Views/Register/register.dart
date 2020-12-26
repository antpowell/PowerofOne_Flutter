import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Services/authentication_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_one/Views/TermsAndConditions/TermsAndConditions.dart';
import 'package:power_one/Views/dialogs.dart';
import 'dart:developer' as dev;

import 'package:power_one/models/PO1User.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  static final String id = 'register_screen';
  @override
  _RegisterState createState() => _RegisterState();
}

_fieldFocusChanger(BuildContext context, FocusNode current, FocusNode next) {
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();

  PO1User _currentUser = PO1User();
  RegExp emailExp = RegExp(r"^$|^.*@.*\..*$");
  RegExp passwordExp = RegExp(r'^.*(?=.{8,}).*$');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const _formStyle = TextStyle(fontSize: 16, color: Colors.white);

  Widget _buildEmail() {
    return TextFormField(
      style: _formStyle,
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      focusNode: _emailFocus,
      decoration: InputDecoration(
        labelText: 'email',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        } else if (!emailExp.hasMatch(value)) {
          return 'Email is not formated correctly';
        }
        return null;
      },
      onFieldSubmitted: (term) {
        _fieldFocusChanger(context, _emailFocus, _passwordFocus);
      },
      onSaved: (String newValue) {
        _currentUser.setEmail(_emailController.text.trim());
      },
    );
  }

  Widget _buildForm() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            _buildEmail(),
            _buildPassword(),
            SizedBox(height: 24),
            _buildButtonGroup(),
          ],
        ),
      ),
    );
  }

  Widget _buildTNDText() {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'By clicking Sign Up, you agree to our ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          ),
          GestureDetector(
            child: Text(
              'Terms ',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              Navigator.pushNamed(context, TermsAndConditions.id);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPassword() {
    final _authService =
        Provider.of<AuthenticationService>(context, listen: false);

    return TextFormField(
      style: _formStyle,
      keyboardType: TextInputType.visiblePassword,
      controller: _passwordController,
      focusNode: _passwordFocus,
      decoration: InputDecoration(
        labelText: 'password',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        } else if (!passwordExp.hasMatch(value)) {
          return 'Password is not formated correctly, must have at lease 8 characters.';
        }
        return null;
      },
      onChanged: (value) {},
      onFieldSubmitted: (term) {
        _formKey.currentState.save();
      },
      onSaved: (String newValue) async {
        String message = await context.read<AuthenticationService>().register(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
        !(message == '${_emailController.text.trim()} account created')
            ? {
                Dialogs.okDialogAction(
                  context,
                  'ERROR: Something went wrong!',
                  message,
                ),
              }
            : {
                dev.log(message),
                Navigator.pushNamed(context, PlayerNameForm.id),
              };
      },
    );
  }

  Widget _buildLogo() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: 85,
        minWidth: 100,
        minHeight: 50,
      ),
      child: Center(
        child: Image(
          image: AssetImage('assets/images/POWER_OF_1_SPORT_LO-FF.png'),
        ),
      ),
    );
  }

  Widget _buildButtonGroup() {
    final User firebaseUser = Provider.of<User>(context);

    final _authService =
        Provider.of<AuthenticationService>(context, listen: false);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Text(
              'Sign in instead ',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          PO1Button('Sign Up', onPress: () {
            _formKey.currentState.save();
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLogo(),
              _buildForm(),
              _buildTNDText(),
            ],
          ),
        ),
      ),
    );
  }
}
