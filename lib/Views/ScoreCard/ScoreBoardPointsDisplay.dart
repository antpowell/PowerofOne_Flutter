import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Point.dart';
import 'package:power_one/Objects/Score.dart';

class ScoreBoardPointsDisplay extends StatefulWidget {
  ScoreBoardPointsDisplay({this.activity});
  @override
  _ScoreBoardPointsDisplayState createState() =>
      _ScoreBoardPointsDisplayState();

  final Score activity;
}

class _ScoreBoardPointsDisplayState extends State<ScoreBoardPointsDisplay> {
  Text _scoreBoardText(label) {
    return Text(
      label,
      style: kLabelTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _scoreBoardText(widget.activity.title),
          Builder(
            builder: (context) {
              if (widget.activity is Point) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _scoreBoardText(widget.activity.pos.toString()),
                    _scoreBoardText(widget.activity.neg.toString()),
                  ],
                );
              } else {
                return _scoreBoardText(widget.activity.pos.toString());
              }
            },
          )
        ],
      ),
    );
  }
}
