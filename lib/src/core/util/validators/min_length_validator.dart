import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';

import 'base_validator.dart';

class MinLengthValidator extends BaseValidator {
  final int minLength;

  MinLengthValidator({required this.minLength});

  @override
  String getMessage(BuildContext? context) {
    return S.of(context!).weak_password_message;
  }

  @override
  bool validate(String value) {
    return value.length >= minLength;
  }
}
