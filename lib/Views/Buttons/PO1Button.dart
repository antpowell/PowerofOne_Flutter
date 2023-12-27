import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PO1Button extends StatelessWidget {
  final String label;
  Function? onPress, onLongPress;
  Icon? icon;
  final bool onLeft;
  final double height = 36;
  final double width = 145;
  final double outlineSize = 1;

  // final ButtonStyle buttonStyle = ButtonStyle(side:);

  PO1Button(
    this.label, {
    this.onPress,
    this.onLongPress,
    this.icon,
    this.onLeft = false,
  });
  Widget displayIcon() {
    Widget localDisplayIcon = icon ?? SizedBox.shrink();

    return localDisplayIcon;
  }

  Widget BaseButton() {
    return Container(
      height: height,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            displayIcon(),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
        onPressed: () => onPress,
        onLongPress: () => onLongPress,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.white,
            width: outlineSize,
          ),
        ),
      ),
    );
  }

  Widget LeftIconButton() {
    // return NeumorphicButton(
    //   onPressed: onPress,
    //   child: Text(
    //     this.label,
    //     style: TextStyle(fontSize: 16, color: Colors.white),
    //   ),
    //   style: NeumorphicStyle(
    //     color: Color(0xff32333D),
    //     shape: NeumorphicShape.flat,
    //     surfaceIntensity: 0.05,
    //     intensity: 0.25,
    //     oppositeShadowLightSource: true,
    //   ),
    // );
    return Container(
      height: height,
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
        onPressed: () => onPress,
        onLongPress: () => onLongPress,
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
    // return NeumorphicButton(child: Text(this.label));
    return onLeft ? BaseButton() : LeftIconButton();
    // return NeumorphicButton(
    //   onPressed: () {},
    //   child: Text(
    //     this.label,
    //     style: TextStyle(fontSize: 16, color: Colors.white),
    //   ),
    //   style: NeumorphicStyle(
    //     color: Color(0xff32333D),
    //     shape: NeumorphicShape.flat,
    //     surfaceIntensity: 0.05,
    //     intensity: 0.25,
    //     // oppositeShadowLightSource: true,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return btn();
  }
}
