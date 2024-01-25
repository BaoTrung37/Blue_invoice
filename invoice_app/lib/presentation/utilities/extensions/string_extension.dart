extension StringExtension1 on String {
  int? get parseToInt {
    try {
      return int.parse(this);
    } catch (e) {
      return null;
    }
  }

  double? get parseToDouble {
    try {
      return double.parse(this);
    } catch (e) {
      return null;
    }
  }
}
