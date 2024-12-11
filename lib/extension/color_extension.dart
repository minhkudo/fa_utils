
import 'package:fa_utils/extension/string_extension.dart';
import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color toColor(String? codeColor, {Color defaultColor = const Color(0xffffffff)}) {
    if (codeColor.hasText) {
      return Color(int.parse('0xff${codeColor?.substring(1)}'));
    }
    return defaultColor;
  }
}
