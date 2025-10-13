extension StringExtension on String? {
  bool get hasText => this != null && this!.trim().isNotEmpty;

  bool get isNull => this == null ;

  int? toInt() {
    if (!hasText) {
      return null;
    }

    return int.tryParse(this!) ?? double.tryParse(this!)?.floor();
  }

  double? toDouble() {
    if (!hasText) {
      return null;
    }

    return double.tryParse(this!);
  }
}
