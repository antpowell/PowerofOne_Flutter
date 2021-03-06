import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Services/authentication_service.dart';
import 'package:power_one/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_one/Views/Register/register.dart';
import 'package:power_one/Views/dialogs.dart';
import 'dart:developer' as dev;

import 'package:power_one/models/PO1User.dart';
import 'package:provider/provider.dart';

class LoginFormScreen extends StatefulWidget {
  static final String id = 'sign_in_screen';
  @override
  _LoginFormScreenState createState() => _LoginFormScreenState();
}

_fieldFocusChanger(BuildContext context, FocusNode current, FocusNode next) {
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();

  PO1User _currentUser = PO1User();
  RegExp emailExp = RegExp(r"^$|^.*@.*\..*$");
  RegExp passwordExp = RegExp(r'^.*(?=.{6,}).*$');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const _formStyle = TextStyle(fontSize: 16, color: Colors.white);

  TextFormField _buildEmail() {
    final _formFieldKeyEmail = GlobalKey<FormFieldState>();

    return TextFormField(
      key: _formFieldKeyEmail,
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
        if (!_formFieldKeyEmail.currentState.validate()) {
          _fieldFocusChanger(context, _emailFocus, _emailFocus);
        } else {
          _fieldFocusChanger(context, _emailFocus, _passwordFocus);
        }
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
          ],
        ),
      ),
    );
  }

  Widget _buildPassword() {
    final _formFieldKeyPassword = GlobalKey<FormFieldState>();

    return TextFormField(
      key: _formFieldKeyPassword,
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
          return 'Password is not formated correctly, must have at lease 6 characters.';
        }
        return null;
      },
      onFieldSubmitted: (term) {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
      },
      onSaved: (String newValue) async {
        String message = await context.read<AuthenticationService>().login(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
        !(message == '${_emailController.text.trim()} signed in')
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: Text(
              'New User? Sign Up!',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onPressed: () => {
              // TODO: Register and create new user [maybe just an Alert]
              Navigator.pushNamed(context, Register.id),
              debugPrint('New user, needs to register.'),
            },
          ),
          FlatButton(
            child: Text(
              'Forgot Password?',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onPressed: () {
              // TODO2: call reset password function here.
              debugPrint('User forgot password and is trying to reset.');
              debugPrint("new current user, ${_currentUser.email}");
              _authService.signOut();
            },
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            color: Colors.white,
            iconSize: 25,
            onPressed: () {
              if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();

              // _authService.signIn(email: _email, password: _password);
              // Navigator.pushNamed(context, '/playerName');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User firebaseUser = Provider.of<User>(context);
    bool hasUser = firebaseUser != null;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
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

class AuthWrapper extends StatelessWidget {
  final PO1User _user = PO1User();

  @override
  Widget build(BuildContext context) {
    final User firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      dev.log('Found user in Firebase: $firebaseUser');
      _user.setId(firebaseUser.uid);
      // Navigator.pushNamed(context, '/playerName');
      return Text('User Found');
    }
    dev.log('No user found in Firebase');
    return Text('No user found');
  }
}
