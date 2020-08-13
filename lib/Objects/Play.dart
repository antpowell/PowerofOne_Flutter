import 'Score.dart';

class Play extends Score {
  Play(String title) : super(title);

  @override
  void miss() {
    print('miss not valid on Play object');
  }

  @override
  void undoMiss() {
    print('undo a miss not valid on Play object');
  }
}
