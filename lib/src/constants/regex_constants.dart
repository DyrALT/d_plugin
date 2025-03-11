class RegexConstants {
  RegexConstants._();
  static final instance = RegexConstants._();
  static final RegExp isUrlRegex = RegExp(
    r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})',
    caseSensitive: false,
  );

  // static final isEmailRegex = RegExp(
  //   r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  // );
  static final isEmailRegex = RegExp(
    r'^([a-zA-Z0-9_.-]+)@([a-zA-Z0-9-]+.)+[a-zA-Z]{2,6}$',
    caseSensitive: false,
  );
}
