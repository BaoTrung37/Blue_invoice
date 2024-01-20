import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatddMMMyyyy => DateFormat('dd MMM yyyy').format(this);
}
