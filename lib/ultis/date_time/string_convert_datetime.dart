import 'package:json_annotation/json_annotation.dart';

class StringConvertDatetime implements JsonConverter<DateTime, String> {
  const StringConvertDatetime();

  @override
  DateTime fromJson(String? json) {
    if (json == null) {
      return DateTime.now();
    }
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return object.toString();
  }
}
