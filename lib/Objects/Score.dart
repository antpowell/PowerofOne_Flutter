abstract class Score {
  int _pos;
  int get pos => _pos;
  set pos(int pos) => _pos = pos;

  int _neg;
  int get neg => _neg;
  set neg(int neg) => _neg = neg;

  String _title;
  String get title => _title;

  Score(String title) {
    _title = title;
    this._pos = 0;
    this._neg = 0;
  }

  Score.play() {
    this._pos = 0;
  }

  setPos(int pos) {
    _pos = pos;
  }

  make() {
    _pos++;
  }

  undoMake() {
    _pos--;
  }

  setNeg(int neg) {
    _neg = neg;
  }

  miss() {}

  undoMiss() {}

  int total() {
    return _pos - _neg;
  }
}
