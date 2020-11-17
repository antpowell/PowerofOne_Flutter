import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PO1Button extends StatelessWidget {
  String label;
  Function onPress, onLongPress;
  Icon icon;
  bool onLeft;
  double height = 36;
  double outlineSize = 1;

  // final ButtonStyle buttonStyle = ButtonStyle(side:);

  PO1Button(
    this.label, {
    this.onPress,
    this.onLongPress,
    this.icon,
    this.onLeft = false,
  });
  Widget displayIcon() {
    return icon != null ? icon : Container();
  }

  Widget btn() {
    return onLeft
        ? Container(
            height: height,
            child: OutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  displayIcon(),
                  Text(
                    label,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              onPressed: onPress,
              onLongPress: onLongPress,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.white,
                  width: outlineSize,
                ),
              ),
            ),
          )
        : Container(
            height: height,
            child: OutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  displayIcon(),
                ],
              ),
              onPressed: onPress,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.white,
                  width: outlineSize,
                ),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return btn();
  }
}
