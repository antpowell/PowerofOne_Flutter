enum PO1PlayerSkill { elementry, middle, high, college, pro }

extension ParseToString on PO1PlayerSkill {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
