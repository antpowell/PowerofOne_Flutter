import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:power_of_one_basketball/models/PO1User.dart';
import 'package:power_of_one_basketball/Services/authentication_service.dart';
import 'package:power_of_one_basketball/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_of_one_basketball/Views/Register/register.dart';
import 'package:power_of_one_basketball/Views/dialogs.dart';
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
        labelStyle: TextStyle(color: Colors.white),
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Email is required';
        } else if (value != null && !emailExp.hasMatch(value)) {
          return 'Email is not formatted correctly';
        }
        return null;
      },
      onFieldSubmitted: (term) {
        if (_formFieldKeyEmail.currentState!.validate()) {
          _fieldFocusChanger(context, _emailFocus, _emailFocus);
        } else {
          _fieldFocusChanger(context, _emailFocus, _passwordFocus);
        }
      },
      onSaved: (String? newValue) {
        _currentUser.setEmail(_emailController.text.trim());
      },
    );
  }

  Widget _buildForm() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Column(children: [_buildEmail(), _buildPassword()]),
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
        labelStyle: TextStyle(color: Colors.white),
      ),
      obscureText: true,
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Password is required';
        } else if (value != null && !passwordExp.hasMatch(value)) {
          return 'Password is not formatted correctly, must have at lease 6 characters.';
        }
        return null;
      },
      onFieldSubmitted: (term) {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        _formKey.currentState!.save();
      },
      onSaved: (String? newValue) async {
        String message = await context.read<AuthenticationService>().login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (message != '${_emailController.text.trim()} signed in') {
          Dialogs.okDialogAction(
            context,
            title: 'ERROR: Something went wrong!',
            body: message,
          );
        } else {
          dev.log(message);
          Navigator.pushNamedAndRemoveUntil(
            context,
            PlayerNameForm.id,
            (route) => false,
          );
        }
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
        child: Image.asset('assets/images/POWER_OF_1_SPORT_LO-FF.png'),
      ),
    );
  }

  Widget _buildButtonGroup() {
    final _authService = Provider.of<AuthenticationService>(
      context,
      listen: false,
    );
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: Text(
              'New User? Sign Up!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ),
            ),
            onPressed: () => {
              Navigator.pushNamed(context, Register.id),
              debugPrint('New user, needs to register.'),
            },
          ),
          TextButton(
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ),
            ),
            onPressed: () async {
              // TODO2: call reset password function here.
              debugPrint('User forgot password and is trying to reset.');

              if (_emailController.text.trim().isNotEmpty) {
                String? message = await _authService.sendPasswordResetFor(
                  email: _emailController.text.trim(),
                );
                _authService.signOut();

                if (message == 'email link sent') {
                  Dialogs.okDialogAction(
                    context,
                    title: "Please check your email",
                    body:
                        "Password reset email has been sent to\n\n${_emailController.text.trim()}",
                  );
                } else {
                  Dialogs.okDialogAction(
                    context,
                    title: "Error",
                    body: message ?? '',
                  );
                }
              } else {
                Dialogs.okDialogAction(
                  context,
                  title: "Please enter your email",
                  body:
                      "Please enter your email into the email field to reset your password",
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            color: Colors.white,
            iconSize: 25,
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              _formKey.currentState!.save();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final User? firebaseUser = Provider.of<User?>(context);
    // bool hasUser = firebaseUser != null;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(24),
        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildLogo(), _buildForm(), _buildButtonGroup()],
            ),
          ),
        ),
      ),
    );
  }
}
