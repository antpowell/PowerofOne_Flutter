import 'package:flutter/material.dart';
import './Objects/Play.dart';
import './Objects/Point.dart';
import 'Objects/Score.dart';

// import 'Data/Point.dart';

class TrackerButton extends StatelessWidget {
  TrackerButton(this.p);
  final Score p;

  @override
  Widget build(BuildContext context) {
    return (p is Point)
        ? Row(
            children: [
              buildTrackerButton(
                Icon(Icons.check),
                Colors.green,
                p.make,
              ),
              buildTrackerButton(
                Icon(Icons.clear),
                Colors.red,
                p.miss,
              ),
            ],
          )
        : buildTrackerButton(
            Text(p.title),
            Colors.green,
            p.make,
          );
  }

  Container buildTrackerButton(Widget w, Color c, Function f) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 80,
          height: 80,
          child: OutlineButton(
            shape: CircleBorder(),
            child: w,
            textColor: c,
            highlightedBorderColor: c,
            borderSide: BorderSide(width: 2, color: c),
            onPressed: () {
              f();
              debugPrint('${p.title} : ${p.total()}');
            },
          ),
        ),
      ),
    );
  }
}
