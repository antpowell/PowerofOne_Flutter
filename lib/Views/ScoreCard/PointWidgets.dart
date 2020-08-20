import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/Play.dart';

class PointWidgets extends StatelessWidget {
  const PointWidgets({Key key, this.activity}) : super(key: key);
  final Play activity;

  Widget tracker() => Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 80,
            height: 80,
            child: OutlineButton(
              shape: CircleBorder(),
              child: Text(activity.title),
              textColor: Colors.green,
              highlightedBorderColor: Colors.green,
              borderSide: BorderSide(width: 2, color: Colors.green),
              onPressed: () {
                // activity.miss();
              },
            ),
          ),
        ),
      );

  Widget display() => Container(
        child: Column(
          children: [
            _scoreBoardText(activity.title),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _scoreBoardText('${activity.pos}'),
                  _scoreBoardText('${activity.neg}'),
                ],
              ),
            ),
          ],
        ),
      );

  Text _scoreBoardText(label) {
    return Text(
      label,
      style: kLabelTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: tracker(),
    );
  }
}
