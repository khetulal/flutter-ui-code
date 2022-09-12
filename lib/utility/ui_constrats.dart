class Regexp {
  static final firstRegex = RegExp(r'^[a-zA-Z]+$', caseSensitive: false);
  static final lastRegex = RegExp(r'^[a-zA-Z]+$', caseSensitive: false);
  static final emailRegex = RegExp(
      r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z]+)\.([a-zA-Z]{2,4})$',
      caseSensitive: false);
  static final mobileRegex = RegExp(r'^[0-9]{10}$');
  static final passwordRegex = RegExp(r'^([\S]{8,})$', caseSensitive: true);
}
