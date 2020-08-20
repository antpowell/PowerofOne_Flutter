import 'package:power_one/Objects/Score/Score.dart';

import 'Command.dart';

class Miss extends Command {
  Score p;

  Miss(Score p) {
    this.p = p;
  }

  @override
  void execute() {
    // p.miss();
  }

  @override
  void undo() {
    // p.undoMiss();
  }
}
