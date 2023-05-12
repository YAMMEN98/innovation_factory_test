import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';

import 'base_validator.dart';

class PasswordValidator extends BaseValidator {
  bool? isFromVerificationPage;
  bool? message;
  List<PasswordValidType> typeValid = [];

  PasswordValidator({this.isFromVerificationPage});

  @override
  String getMessage(BuildContext? context) {
    if (isFromVerificationPage != null && isFromVerificationPage!) return '*';
    String message = "";
    if (context != null) {
      for (var element in typeValid) {
        switch (element) {
          case PasswordValidType.passwordIsEmpty:
            message = message + S.of(context).password_is_empty;
            break;
          case PasswordValidType.passwordShouldContainAtLast8Characters:
            message = message + S.of(context).password_should_contain_at_least_8_characters;
            break;
          case PasswordValidType.passwordShouldContainAtLeastOneLowercaseLetter:
            message = message + S.of(context).password_should_contain_at_least_one_lowercase_letter;
            break;
          case PasswordValidType.passwordShouldContainAtLeastOneNumber:
            message = message + S.of(context).password_should_contain_at_least_one_number;
            break;
          case PasswordValidType.passwordShouldContainAtLeastOneSymbol:
            message = message + S.of(context).password_should_contain_at_least_one_symbol;
            break;
          case PasswordValidType.passwordShouldContainAtLeastOneUppercaseLetter:
            message = message + S.of(context).password_should_contain_at_least_one_uppercase_letter;
            break;
        }
      }
    }

    return message == "" ? S.of(context!).weak_password_message : message;
  }

  @override
  bool validate(String value) {
    typeValid.clear();
    if (value.isEmpty) {
      typeValid.add(PasswordValidType.passwordIsEmpty);
      return false;
    }
    // if (!RegExp("(?=.*^[\u0600-\u06FF])").hasMatch(value.trim())) this.typeValids.add(PasswordValidType.password_should_contain_at_least_one_lowercase_letter);

    if (value.length < 8) typeValid.add(PasswordValidType.passwordShouldContainAtLast8Characters);
    if (!RegExp("(.*([\u0621-\u064A])+.*)").hasMatch(value.trim())) {
      if (!RegExp("(?=.*[a-z])").hasMatch(value.trim())) typeValid.add(PasswordValidType.passwordShouldContainAtLeastOneLowercaseLetter);
      if (!RegExp("(?=.*[A-Z])").hasMatch(value.trim())) typeValid.add(PasswordValidType.passwordShouldContainAtLeastOneUppercaseLetter);
    }
    if (!RegExp("(?=.*([0-9]|[\u0660-\u0669]))").hasMatch(value.trim())) {
      typeValid.add(PasswordValidType.passwordShouldContainAtLeastOneNumber);
    }

    bool isSpectral = false;
    for (int i = 0; i < value.split('').length; i++) {
      if (!RegExp(".*([0-9A-Z\u0660-\u0669a-z\u0621-\u064A])").hasMatch(value.split('')[i])) {
        isSpectral = true;

        break;
      }
    }
    if (!isSpectral) {
      typeValid.add(PasswordValidType.passwordShouldContainAtLeastOneSymbol);
    }

    return typeValid.isEmpty;
  }
}

enum PasswordValidType {
  passwordIsEmpty,
  passwordShouldContainAtLast8Characters,
  passwordShouldContainAtLeastOneLowercaseLetter,
  passwordShouldContainAtLeastOneNumber,
  passwordShouldContainAtLeastOneSymbol,
  passwordShouldContainAtLeastOneUppercaseLetter
}
