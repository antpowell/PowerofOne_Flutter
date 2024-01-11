import 'dart:developer' as dev;

import 'package:flutter/material.dart';

class PO1Button extends StatelessWidget {
  final String label;
  final Function? _onPress, _onLongPress;
  Icon? icon;
  final bool onLeft;
  // final double height = 36;
  // final double width = 145;
  final double outlineSize = 1;

  PO1Button(
    this.label, {
    Function? onPress,
    Function? onLongPress,
    this.icon,
    this.onLeft = false,
  })  : _onLongPress = onLongPress,
        _onPress = onPress;
  Widget displayIcon() {
    Widget localDisplayIcon = icon ?? SizedBox.shrink();

    return localDisplayIcon;
  }

  Widget baseButton() {
    return Container(
      // height: height,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            displayIcon(),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        onPressed: () => _onPress!(),
        onLongPress: () => _onLongPress,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.white,
            width: outlineSize,
          ),
        ),
      ),
    );
  }

  Widget leftIconButton() {
    return Container(
      // height: height,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            displayIcon(),
          ],
        ),
        onPressed: () => _onPress,
        onLongPress: () => _onLongPress,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.white,
            width: outlineSize,
          ),
        ),
      ),
    );
  }

  Widget btn() {
    return onLeft ? leftIconButton() : baseButton();
  }

  @override
  Widget build(BuildContext context) {
    return btn();
  }
}
