import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

double getWidthDevice(context) => MediaQuery.of(context).size.width;

double getHeightDevice(context) => MediaQuery.of(context).size.height;

int parseIntColor(String? color) => (color == null) ? 0xffffffff : int.parse('0xff${color.substring(1)}');

Color parseString2Color(String? color) => (color == null || color.isEmpty) ? const Color(0xffffffff) : Color(int.parse('0xff${color.substring(1)}'));

T responsiveByDeviceType<T>({required T mobile, T? tablet}) {
  var deviceType = SizerUtil.deviceType;
  switch (deviceType) {
    case DeviceType.tablet:
      return tablet ?? mobile;
    case DeviceType.mobile:
      return mobile;
    default:
      return mobile;
  }
}

String nonAccentVietnamese(String str) {
  var vietnameseSigns = [
    "aAeEoOuUiIdDyY",
    "áàạảãâấầậẩẫăắằặẳẵ",
    "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
    "éèẹẻẽêếềệểễ",
    "ÉÈẸẺẼÊẾỀỆỂỄ",
    "óòọỏõôốồộổỗơớờợởỡ",
    "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
    "úùụủũưứừựửữ",
    "ÚÙỤỦŨƯỨỪỰỬỮ",
    "íìịỉĩ",
    "ÍÌỊỈĨ",
    "đ",
    "Đ",
    "ýỳỵỷỹ",
    "ÝỲỴỶỸ"
  ];
  str = str.toLowerCase();

  for (int i = 1; i < vietnameseSigns.length; i++) {
    for (int j = 0; j < vietnameseSigns[i].length; j++) {
      str = str.replaceAll(vietnameseSigns[i][j], vietnameseSigns[0][i - 1]);
    }
  }
  return str;
}
