DateTimeUltis dateTimeUltis = DateTimeUltis();

class DateTimeUltis {
  String convertDateTime2String(DateTime dateTime) {
    var timeExpect = dateTime;
    var currentTime = DateTime.now();
    var timeDurationDelta = timeExpect.difference(currentTime);

    switch (timeDurationDelta.inDays) {
      case 0:
        if (timeDurationDelta.inHours == 0) {
          if (timeDurationDelta.inMinutes == 0) {
            return 'Vừa xong';
          } else {
            return '${-timeDurationDelta.inMinutes} phút trước';
          }
        } else {
          return '${-timeDurationDelta.inHours} giờ trước';
        }
      case -1:
        return '1 ngày trước';
      case -2:
        return '2 ngày trước';
      case -3:
        return '3 ngày trước';
      default:
        return '${dateTime.day} - ${(dateTime.month < 10) ? '0${dateTime.month}' : dateTime.month} - ${dateTime.year}';
    }
  }
}
