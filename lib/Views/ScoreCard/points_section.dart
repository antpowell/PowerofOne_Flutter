import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:power_one/Data/constants.dart';
import 'package:power_one/Objects/PO1Score.dart';
import 'package:power_one/Objects/Point.dart';
import '../../TrackerButton.dart';
import 'package:provider/provider.dart';

class PointsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Iterable<Point> pointsList =
        context.select((PO1Score a) => a.pointsMap.values);

    Widget pointsButtonsGroup() {
      List<Widget> _pointButtons = [];
      pointsList.forEach((element) => _pointButtons.add(Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                element.title,
                style: kLabelTextStyle,
              ),
              TrackerButton(element),
            ],
          )));
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _pointButtons,
      );
    }

    return pointsButtonsGroup();
  }
}
