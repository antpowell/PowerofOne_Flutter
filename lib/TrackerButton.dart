import 'package:flutter/material.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:provider/provider.dart';
import './Objects/Point.dart';
import 'Objects/Score/Score.dart';

class TrackerButton extends StatelessWidget {
  final IScore _activity;
  final double _boxSize = 65;
  TrackerButton(this._activity);

  @override
  Widget build(BuildContext context) {
    return (_activity is Point)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTrackerButton(
                label: Icon(Icons.check),
                color: Colors.green,
                onPress: Provider.of<PO1Score>(context).made,
                pointInstance: _activity,
              ),
              buildTrackerButton(
                label: Icon(Icons.clear),
                color: Colors.red,
                onPress: Provider.of<PO1Score>(context).missed,
                pointInstance: _activity,
              ),
            ],
          )
        : buildTrackerButton(
            label: Text(_activity.title),
            color: Colors.white,
            onPress: Provider.of<PO1Score>(context).made,
            pointInstance: _activity,
          );
  }

  Widget buildTrackerButton({
    Widget label,
    Color color,
    Function onPress,
    IScore pointInstance,
  }) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: _boxSize,
          height: _boxSize,
          child: OutlineButton(
            shape: CircleBorder(),
            child: label,
            textColor: color,
            highlightedBorderColor: color,
            borderSide: BorderSide(width: 2, color: color),
            onPressed: () => onPress(pointInstance),
          ),
        ),
      ),
    );
  }
}
