import 'package:flutter/material.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:provider/provider.dart';
import './Objects/Point.dart';
import 'Objects/Score/Score.dart';

class TrackerButton extends StatelessWidget {
  final IScore _activity;
  final double _boxSize = 70;
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
                Provider.of<PO1Score>(context).made,
                _activity,
              ),
              buildTrackerButton(
                Icon(Icons.clear),
                Colors.red,
                Provider.of<PO1Score>(context).missed,
                _activity,
              ),
            ],
          )
        : buildTrackerButton(
            Text(_activity.title),
            Colors.green,
            Provider.of<PO1Score>(context).made,
            _activity,
          );
  }

  Widget buildTrackerButton(Widget w, Color c, Function f, IScore activity) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: _boxSize,
          height: _boxSize,
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
    );
  }
}
