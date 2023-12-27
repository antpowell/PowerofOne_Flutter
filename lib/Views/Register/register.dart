import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Services/RevenueCat/revenue_cat_service.dart';
import 'package:power_one/Services/authentication_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/PlayerName/PlayerNameForm.dart';
import 'package:power_one/Views/TermsAndConditions/TermsAndConditions.dart';
import 'package:power_one/Views/dialogs.dart';
import 'dart:developer' as dev;

import 'package:power_one/Models/PO1User.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

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
      validator: (String? value) {
        if (value != null  && value.isEmpty) {
          return 'Email is required';
        } else if (value != null && !emailExp.hasMatch(value)) {
          return 'Email is not formatted correctly';
        }
        return null;
      },
      onFieldSubmitted: (term) {
        if (!_formFieldKeyEmail.currentState!.validate()) {
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
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Password is required';
        } else if (value != null && !passwordExp.hasMatch(value)) {
          return 'Password is not formated correctly, must have at lease 8 characters.';
        }
        return null;
      },
      onChanged: (value) {},
      onFieldSubmitted: (term) {
        _formKey.currentState!.save();
      },
      onSaved: (String? newValue) async {
        String? message = await context.read<AuthenticationService>().register(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
        if (message != '${_emailController.text.trim()} account created') {
          Dialogs.okDialogAction(
            context,
            title: 'ERROR: Something went wrong!',
            body: message ?? "message was not found when registering user from Register Screen.\nAccount should have been created.",
          );
        } else {
          dev.log(message ?? "message was not found when registering user from Register Screen");
          // LogInResult loginResults = await context
          //     .read<InnAppPurchaseService>()
          //     .logIn(context.read<User>().uid);
          // print('loginResults: $loginResults.purchaseDetails');
          Navigator.pushNamed(context, PlayerNameForm.id);
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
            _formKey.currentState!.save();
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
