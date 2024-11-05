extension StringExtension on String? {
  bool get hasText => this != null && this!.isNotEmpty;
}
