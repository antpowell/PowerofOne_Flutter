import 'package:power_one/Models/PO1HustlePoint.dart';
import 'package:power_one/Models/PO1Level.dart';
import 'package:power_one/Models/PO1Point.dart';
import 'package:power_one/Models/PO1User.dart';

class Standard {
  HustlePoint stl;
  HustlePoint rb;
  HustlePoint ast;
  HustlePoint blk;
  HustlePoint to;
  HustlePoint pf;
  PO1Point fg, ft;

  PO1User _user = new PO1User();

  Standard({PO1User user}) {
    this.stl = _stl;
    this.rb = _rb;
    this.ast = _ast;
    this.blk = _blk;
    this.to = _to;
    // this.pf = _pf;
    this.fg = _fg;
    this.ft = _ft;
    this._user = _user;
  }

  final HustlePoint _stl = new HustlePoint(
    great: {
      {PO1Levels.PRO: 4},
      {PO1Levels.COLHIGH: 4},
      {PO1Levels.GRADE: 4},
    },
    good: {
      {PO1Levels.PRO: 3},
      {PO1Levels.COLHIGH: 3},
      {PO1Levels.GRADE: 3},
    },
    average: {
      {PO1Levels.PRO: 2},
      {PO1Levels.COLHIGH: 2},
      {PO1Levels.GRADE: 2},
    },
  );
  final HustlePoint _rb = new HustlePoint(
    great: {
      {PO1Levels.PRO: 10},
      {PO1Levels.COLHIGH: 8},
      {PO1Levels.GRADE: 7},
    },
    good: {
      {PO1Levels.PRO: 8},
      {PO1Levels.COLHIGH: 6},
      {PO1Levels.GRADE: 5},
    },
    average: {
      {PO1Levels.PRO: 6},
      {PO1Levels.COLHIGH: 4},
      {PO1Levels.GRADE: 3},
    },
  );
  final HustlePoint _ast = new HustlePoint(
    great: {
      {PO1Levels.PRO: 9},
      {PO1Levels.COLHIGH: 8},
      {PO1Levels.GRADE: 7},
    },
    good: {
      {PO1Levels.PRO: 7},
      {PO1Levels.COLHIGH: 6},
      {PO1Levels.GRADE: 5},
    },
    average: {
      {PO1Levels.PRO: 5},
      {PO1Levels.COLHIGH: 4},
      {PO1Levels.GRADE: 3},
    },
  );
  final HustlePoint _blk = new HustlePoint(
    great: {
      {PO1Levels.PRO: 3},
      {PO1Levels.COLHIGH: 3},
      {PO1Levels.GRADE: 3},
    },
    good: {
      {PO1Levels.PRO: 2},
      {PO1Levels.COLHIGH: 2},
      {PO1Levels.GRADE: 2},
    },
    average: {
      {PO1Levels.PRO: 1},
      {PO1Levels.COLHIGH: 1},
      {PO1Levels.GRADE: 1},
    },
  );
  final HustlePoint _to = new HustlePoint(
    great: {
      {PO1Levels.PRO: 0},
      {PO1Levels.COLHIGH: 0},
      {PO1Levels.GRADE: 0},
    },
    good: {
      {PO1Levels.PRO: 1},
      {PO1Levels.COLHIGH: 1},
      {PO1Levels.GRADE: 1},
    },
    average: {
      {PO1Levels.PRO: 2},
      {PO1Levels.COLHIGH: 2},
      {PO1Levels.GRADE: 2},
    },
  );

  Map<String, num> get getSteals => {
        'great': stl.great
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'good': stl.good
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'average': stl.average
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
      };
  Map<String, num> get getRebounds => {
        'great': rb.great
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'good': rb.good
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'average': rb.average
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
      };
  Map<String, num> get getAssists => {
        'great': ast.great
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'good': ast.good
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'average': ast.average
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
      };
  Map<String, num> get getBlocks => {
        'great': blk.great
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'good': blk.good
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'average': blk.average
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
      };
  Map<String, num> get getTurnOvers => {
        'great': to.great
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'good': to.good
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'average': to.average
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
      };

  final PO1Point _ft = new PO1Point(
    great: {
      {PO1Levels.PRO: 95},
      {PO1Levels.COLHIGH: 90},
      {PO1Levels.GRADE: 80},
    },
    good: {
      {PO1Levels.PRO: 85},
      {PO1Levels.COLHIGH: 80},
      {PO1Levels.GRADE: 70},
    },
    average: {
      {PO1Levels.PRO: 75},
      {PO1Levels.COLHIGH: 70},
      {PO1Levels.GRADE: 65},
    },
  );
  final PO1Point _fg = new PO1Point(
    great: {
      {PO1Levels.PRO: 50},
      {PO1Levels.COLHIGH: 45},
      {PO1Levels.GRADE: 40},
    },
    good: {
      {PO1Levels.PRO: 45},
      {PO1Levels.COLHIGH: 40},
      {PO1Levels.GRADE: 35},
    },
    average: {
      {PO1Levels.PRO: 40},
      {PO1Levels.COLHIGH: 35},
      {PO1Levels.GRADE: 30},
    },
  );

  Map<String, num> get freeThrow => {
        'great': ft.great
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'good': ft.good
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'average': ft.average
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
      };
  Map<String, num> get feildGoal => {
        'great': fg.great
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'good': fg.good
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
        'average': fg.average
            .where((element) => element.containsKey(_user.playerLevel))
            .first[_user.playerLevel],
      };

  generateBaseStandardsForUserLevel() {
    return {
      'stl': {
        'great': stl.great
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'good': stl.good
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'average': stl.average
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
      },
      'rb': {
        'great': rb.great
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'good': rb.good
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'average': rb.average
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
      },
      'ast': {
        'great': ast.great
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'good': ast.good
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'average': ast.average
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
      },
      'blk': {
        'great': blk.great
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'good': blk.good
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'average': blk.average
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
      },
      'to': {
        'great': to.great
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'good': to.good
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
        'average': to.average
            .where((element) => element.containsKey(PO1User().playerLevel))
            .first[PO1User().playerLevel],
      },
    };
  }

  static miniThresholdByPlayerLevel() {
    return PO1User().playerLevel == PO1Levels.GRADE
        ? 5
        : PO1User().playerLevel == PO1Levels.COLHIGH
            ? 9
            : 13;
  }
}
