import 'package:flutter_test/flutter_test.dart';
import 'package:power_one/models/PO1Grade.dart';
import 'package:power_one/models/PO1PlayerSkill.dart';
import 'package:power_one/models/PO1User.dart';

void main() {
  test("Power of 1 Grade should return A for each category", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.elementary;
    expect(PO1Grade.calculateGrade(5), 'A');
    user.playerSkill = PO1PlayerSkill.high;
    expect(PO1Grade.calculateGrade(9), 'A');
    user.playerSkill = PO1PlayerSkill.college;
    expect(PO1Grade.calculateGrade(9), 'A');
    user.playerSkill = PO1PlayerSkill.pro;
    expect(PO1Grade.calculateGrade(17), 'A');
  });
  test("Power of 1 Grade should return B for each category", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.elementary;
    expect(PO1Grade.calculateGrade(4), 'B');
    user.playerSkill = PO1PlayerSkill.high;
    expect(PO1Grade.calculateGrade(7), 'B');
    user.playerSkill = PO1PlayerSkill.college;
    expect(PO1Grade.calculateGrade(7), 'B');
    user.playerSkill = PO1PlayerSkill.pro;
    expect(PO1Grade.calculateGrade(13), 'B');
  });
  test("Power of 1 Grade should return C for each category", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.elementary;
    expect(PO1Grade.calculateGrade(3), 'C');
    user.playerSkill = PO1PlayerSkill.high;
    expect(PO1Grade.calculateGrade(5), 'C');
    user.playerSkill = PO1PlayerSkill.college;
    expect(PO1Grade.calculateGrade(5), 'C');
    user.playerSkill = PO1PlayerSkill.pro;
    expect(PO1Grade.calculateGrade(9), 'C');
  });
  test("Power of 1 Grade should return D for each category", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.elementary;
    expect(PO1Grade.calculateGrade(2), 'D');
    user.playerSkill = PO1PlayerSkill.high;
    expect(PO1Grade.calculateGrade(3), 'D');
    user.playerSkill = PO1PlayerSkill.college;
    expect(PO1Grade.calculateGrade(3), 'D');
    user.playerSkill = PO1PlayerSkill.pro;
    expect(PO1Grade.calculateGrade(5), 'D');
  });
  test("Power of 1 Grade should return F for each category", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.elementary;
    expect(PO1Grade.calculateGrade(1), 'F');
    user.playerSkill = PO1PlayerSkill.high;
    expect(PO1Grade.calculateGrade(1), 'F');
    user.playerSkill = PO1PlayerSkill.college;
    expect(PO1Grade.calculateGrade(1), 'F');
    user.playerSkill = PO1PlayerSkill.pro;
    expect(PO1Grade.calculateGrade(1), 'F');
  });

  test("Power of 1 Grade for elementary school players receives proper grades ",
      () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.elementary;
    expect(PO1Grade.calculateGrade(5), 'A');
    expect(PO1Grade.calculateGrade(4), 'B');
    expect(PO1Grade.calculateGrade(3), 'C');
    expect(PO1Grade.calculateGrade(2), 'D');
    expect(PO1Grade.calculateGrade(1), 'F');
  });
  test("Power of 1 Grade for middle school players receives proper grades", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.middle;
    expect(PO1Grade.calculateGrade(5), 'A');
    expect(PO1Grade.calculateGrade(4), 'B');
    expect(PO1Grade.calculateGrade(3), 'C');
    expect(PO1Grade.calculateGrade(2), 'D');
    expect(PO1Grade.calculateGrade(1), 'F');
  });

  test("Power of 1 Grade for high school players receives proper grades", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.high;
    expect(PO1Grade.calculateGrade(9), 'A');
    expect(PO1Grade.calculateGrade(7), 'B');
    expect(PO1Grade.calculateGrade(5), 'C');
    expect(PO1Grade.calculateGrade(3), 'D');
    expect(PO1Grade.calculateGrade(1), 'F');
  });

  test("Power of 1 Grade for college players receives proper grades", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.college;
    expect(PO1Grade.calculateGrade(9), 'A');
    expect(PO1Grade.calculateGrade(7), 'B');
    expect(PO1Grade.calculateGrade(5), 'C');
    expect(PO1Grade.calculateGrade(3), 'D');
    expect(PO1Grade.calculateGrade(1), 'F');
  });

  test("Power of 1 Grade for pro players receives proper grades", () {
    PO1User user = new PO1User();

    user.playerSkill = PO1PlayerSkill.pro;
    expect(PO1Grade.calculateGrade(17), 'A');
    expect(PO1Grade.calculateGrade(13), 'B');
    expect(PO1Grade.calculateGrade(9), 'C');
    expect(PO1Grade.calculateGrade(5), 'D');
    expect(PO1Grade.calculateGrade(1), 'F');
  });
}
