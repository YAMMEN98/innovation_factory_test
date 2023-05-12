// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `العربية`
  String get arabic {
    return Intl.message(
      'العربية',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Login to Existing User`
  String get login_to_existing_user {
    return Intl.message(
      'Login to Existing User',
      name: 'login_to_existing_user',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get password_does_not_match {
    return Intl.message(
      'Password does not match',
      name: 'password_does_not_match',
      desc: '',
      args: [],
    );
  }

  /// `The password is weak`
  String get weak_password_message {
    return Intl.message(
      'The password is weak',
      name: 'weak_password_message',
      desc: '',
      args: [],
    );
  }

  /// `Password is empty\n`
  String get password_is_empty {
    return Intl.message(
      'Password is empty\n',
      name: 'password_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least 8 characters\n`
  String get password_should_contain_at_least_8_characters {
    return Intl.message(
      'Password should contain at least 8 characters\n',
      name: 'password_should_contain_at_least_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least one lowercase letter\n`
  String get password_should_contain_at_least_one_lowercase_letter {
    return Intl.message(
      'Password should contain at least one lowercase letter\n',
      name: 'password_should_contain_at_least_one_lowercase_letter',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least one uppercase letter\n`
  String get password_should_contain_at_least_one_uppercase_letter {
    return Intl.message(
      'Password should contain at least one uppercase letter\n',
      name: 'password_should_contain_at_least_one_uppercase_letter',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least one number\n`
  String get password_should_contain_at_least_one_number {
    return Intl.message(
      'Password should contain at least one number\n',
      name: 'password_should_contain_at_least_one_number',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least one symbol\n`
  String get password_should_contain_at_least_one_symbol {
    return Intl.message(
      'Password should contain at least one symbol\n',
      name: 'password_should_contain_at_least_one_symbol',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect Phone Number`
  String get incorrect_phone_number {
    return Intl.message(
      'Incorrect Phone Number',
      name: 'incorrect_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get required_field {
    return Intl.message(
      'Required Field',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server Error`
  String get internal_server_error {
    return Intl.message(
      'Internal Server Error',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get server_error {
    return Intl.message(
      'Server Error',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address entered. Please check the email address and try again.`
  String get invalid_email_address {
    return Intl.message(
      'Invalid email address entered. Please check the email address and try again.',
      name: 'invalid_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Remember Login Info`
  String get remember_login_info {
    return Intl.message(
      'Remember Login Info',
      name: 'remember_login_info',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have An Account? `
  String get do_not_have_an_account {
    return Intl.message(
      'Don\'t Have An Account? ',
      name: 'do_not_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
