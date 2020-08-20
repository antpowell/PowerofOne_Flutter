import 'package:power_one/Objects/Score/Score.dart';

import 'Command.dart';

class Made extends Command {
  Score p;

  Made(Score p) {
    this.p = p;
  }

  @override
  void execute() {
    // p.make();
  }

  @override
  void undo() {
    // p.undoMake();
  }
}
