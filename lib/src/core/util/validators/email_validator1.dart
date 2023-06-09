import 'package:email_validator/email_validator.dart' as ev;
import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';

import 'base_validator.dart';

class EmailValidator extends BaseValidator {
  @override
  String getMessage(BuildContext? context) {
    return S.of(context!).invalid_email_address;
  }

  @override
  bool validate(String value) {
    return ev.EmailValidator.validate(value);
  }
}
