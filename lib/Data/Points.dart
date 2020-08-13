import 'package:flutter/foundation.dart';

import 'Point.dart';
import 'constants.dart';

class Points {
  List<Point> _dualStatPointCollection = [];
  List<Point> _singleStatPointCollection = [];

  Points(List<Map<String, Object>> data) {
    kPoints.where((point) => point["dual"]).forEach((p) {
      debugPrint(p.toString());
      _dualStatPointCollection.add(Point(p["label"], p["dual"]));
    });

    kPoints.where((point) => !point["dual"]).forEach((p) {
      debugPrint(p.toString());
      _singleStatPointCollection.add(Point(p["label"], p["dual"]));
    });

    debugPrint("Points");
    kLabels["points"].forEach((element) {
      debugPrint(element.toString());
    });

    debugPrint("Plays");
    kLabels["plays"].forEach((element) {
      debugPrint(element.toString());
    });
  }

  List<Point> getDualStatPointCollection() {
    return _dualStatPointCollection;
  }

  List<Point> getSingleStatPointCollection() {
    return _singleStatPointCollection;
  }
}
