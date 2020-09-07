import 'package:flutter/material.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:provider/provider.dart';
import './Objects/Point.dart';
import 'Objects/Score/Score.dart';

class TrackerButton extends StatelessWidget {
  final Score _activity;
  TrackerButton(this._activity);

  @override
  Widget build(BuildContext context) {
    return (_activity is Point)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTrackerButton(
                Icon(Icons.check),
                Colors.green,
                Provider.of<Activities>(context).made,
                _activity,
              ),
              buildTrackerButton(
                Icon(Icons.clear),
                Colors.red,
                Provider.of<Activities>(context).missed,
                _activity,
              ),
            ],
          )
        : buildTrackerButton(
            Text(_activity.title),
            Colors.green,
            Provider.of<Activities>(context).made,
            _activity,
          );
  }

  Widget buildTrackerButton(Widget w, Color c, Function f, Score activity) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: 70,
            height: 70,
            child: OutlineButton(
              shape: CircleBorder(),
              child: w,
              textColor: c,
              highlightedBorderColor: c,
              borderSide: BorderSide(width: 2, color: c),
              onPressed: () => f(activity),
            ),
          ),
        ),
      ),
    );
  }
}
