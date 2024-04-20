import 'package:fa_utils/ultis/date_time/date_time_ultis.dart';

extension CompareCurrentTime2StringExtension on DateTime {
  String get compareCurrentTime2String => dateTimeUltis.convertDateTime2String(this);
}
