import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:power_one/Objects/Activities.dart';
import 'package:power_one/Objects/Point.dart';
import '../../TrackerButton.dart';
import 'package:provider/provider.dart';

class PointsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Iterable<Point> pointsList =
        context.select((Activities a) => a.pointsMap.values);

    Widget pointsButtonsGroup() {
      List<Widget> _pointButtons = [];
      pointsList
          .forEach((element) => _pointButtons.add(TrackerButton(element)));
      return Column(
        children: _pointButtons,
      );
    }

    return pointsButtonsGroup();
  }
}
