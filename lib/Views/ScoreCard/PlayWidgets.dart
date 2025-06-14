import 'package:flutter/material.dart';
import 'package:power_of_one_basketball/Data/constants.dart';
import 'package:power_of_one_basketball/Objects/Play.dart';

class PlayWidgets extends StatelessWidget {
  const PlayWidgets({Key? key, required this.activity}) : super(key: key);
  final Play activity;

  Widget tracker() => Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 80,
        height: 80,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(CircleBorder()),
            textStyle: WidgetStateProperty.all(TextStyle(color: Colors.green)),
            overlayColor: WidgetStateProperty.all(Colors.green),
            side: WidgetStateProperty.all(
              BorderSide(width: 2, color: Colors.green),
            ),
          ),
          child: Text(activity.title),
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
        Container(child: _scoreBoardText('${activity.pos}')),
      ],
    ),
  );

  Text _scoreBoardText(label) {
    return Text(label, style: kLabelTextStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: tracker());
  }
}
