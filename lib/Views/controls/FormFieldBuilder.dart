import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/models/PO1User.dart';

class FormFieldBuilder extends StatelessWidget {
  final String? label;
  final String? type;
  final TextInputType? keyboard;
  final bool? hide;

  const FormFieldBuilder(
    Key key, {
    this.label,
    this.type,
    this.keyboard,
    this.hide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegExp emailExp = RegExp(r"^$|^.*@.*\..*$");
    PO1User _currentUser = PO1User();

    return Container(
      child: TextFormField(
        style: formInputStyle,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return '$label is required';
          } else if (value != null && !emailExp.hasMatch(value)) {
            return '$label is not formated correctly';
          }
          return null;
        },
        onSaved: (String? newValue) {
          newValue != null && _currentUser.setEmail(newValue);
        },
      ),
    );
  }
}
