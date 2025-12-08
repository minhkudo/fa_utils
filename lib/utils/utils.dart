import 'package:sizer/sizer.dart';

T responsive<T>({
  required T mobile,
  T? tablet,
  T? desktop,
}) {
  final map = {
    ScreenType.mobile: mobile,
    ScreenType.tablet: tablet ?? mobile,
    ScreenType.desktop: desktop ?? tablet ?? mobile,
  };

  return map[Device.screenType] ?? mobile;
}
