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
            label: Text(
              _activity.title,
              style: TextStyle(fontSize: 18),
            ),
            color: Colors.white,
            onPress: Provider.of<PO1Score>(context).made,
            pointInstance: _activity,
          );
  }

  Widget buildTrackerButton({
    required Widget label,
    required Color color,
    required Function onPress,
    required IScore pointInstance,
  }) {
    // return Container(
    //   child: Padding(
    //     padding: const EdgeInsets.all(2.0),
    //     child: SizedBox(
    //       width: _boxSize,
    //       height: _boxSize,
    //       child: OutlinedButton(
    //         style: OutlinedButton.styleFrom(
    //           foregroundColor: color,
    //           shape: CircleBorder(),
    //           side: BorderSide(width: 2, color: color),
    //           textStyle: TextStyle(color: color),
    //         ),
    //         child: label,
    //         onPressed: () => onPress(pointInstance),
    //       ),
    //     ),
    //   ),
    // );

    return OutlinedButton(
      onPressed: () => onPress(pointInstance),
      child: label,
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        minimumSize:
            color == Colors.white ? Size.fromRadius(38) : Size.fromRadius(30),
        maximumSize:
            color == Colors.white ? Size.fromRadius(48) : Size.fromRadius(40),
        foregroundColor: color,
        side: BorderSide(color: color),
      ),
    );
  }
}
