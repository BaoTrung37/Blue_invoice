import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class JsonDateTimeConverter implements JsonConverter<DateTime, String> {
  const JsonDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime json) => DateFormat('yyyy-MM-dd').format(json);
}
