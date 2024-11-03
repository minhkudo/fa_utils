import 'package:sizer/sizer.dart';

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