extension StringExtension on String {
  int? get parseToInt {
    try {
      return int.parse(this);
    } catch (e) {
      return 0;
    }
  }

  double? get parseToDouble {
    try {
      return double.parse(this);
    } catch (e) {
      return 0;
    }
  }
}
