import 'package:power_of_one_basketball/models/PO1HustlePoint.dart';

import 'Score/Score.dart';

class Play extends IScore {
  //Play type doesn't have a negative value
  Play(EHustlePoint title, [int pos = 0]) : super(title.name, pos, 0);

  // @override
  // void miss() {
  //   print('miss not valid on Play object');
  // }

  // @override
  // void undoMiss() {
  //   print('undo a miss not valid on Play object');
  // }
  @override
  String toString() {
    return 'hustlepoint $pos';
  }
}
