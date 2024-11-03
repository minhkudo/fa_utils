import 'package:json_annotation/json_annotation.dart';

class LongSecondConvertDatetime implements JsonConverter<DateTime, num> {
  const LongSecondConvertDatetime();

  @override
  DateTime fromJson(num json) => DateTime.fromMillisecondsSinceEpoch(json.round() * 1000);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch ~/ 1000;
}
