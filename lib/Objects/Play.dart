import 'Score/Score.dart';

class Play extends IScore {
  //Play type doesn't have a negative value
  Play(String title, [int pos = 0]) : super(title, pos, 0);

  // @override
  // void miss() {
  //   print('miss not valid on Play object');
  // }

  // @override
  // void undoMiss() {
  //   print('undo a miss not valid on Play object');
  // }
}
