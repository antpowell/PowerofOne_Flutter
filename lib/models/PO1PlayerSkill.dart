enum PO1PlayerSkill { elementary, middle, high, college, pro }

extension ParseToString on PO1PlayerSkill {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
