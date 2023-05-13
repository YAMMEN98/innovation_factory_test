import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';

import 'base_validator.dart';

class PhoneNumberValidator extends BaseValidator {
  @override
  String getMessage(BuildContext? context) {
    return S.of(context!).incorrect_phone_number;
  }

  @override
  bool validate(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value.trim())) {
      return false;
    }
    return true;
  }
}
