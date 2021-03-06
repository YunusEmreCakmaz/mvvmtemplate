import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringExtension on String {
  String get locale => this.tr();

  String get isValidEmail => contains(RegExp(ApplicationConstants.EMAIL_REGEX)) ? null : 'Email is not valid';
}

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}
