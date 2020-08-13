import 'Score.dart';

class Point extends Score {
  Point(String title) : super(title);

  @override
  void miss() {
    ++neg;
  }

  @override
  void undoMiss() {
    --neg;
  }
}
