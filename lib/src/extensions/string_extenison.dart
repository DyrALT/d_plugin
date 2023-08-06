import 'package:d_plugin/src/constants/regex_constants.dart';

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isUrl {
    if (isNullOrEmpty) return false;
    return RegexConstants.isUrlRegex.hasMatch(this!);
  }

  bool get isEmail {
    if (isNullOrEmpty) return false;
    return RegexConstants.isEmailRegex.hasMatch(this!);
  }
}
