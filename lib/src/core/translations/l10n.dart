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

  /// `. Password is empty\n`
  String get password_is_empty {
    return Intl.message(
      '. Password is empty\n',
      name: 'password_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `. Password should contain at least 8 characters\n`
  String get password_should_contain_at_least_8_characters {
    return Intl.message(
      '. Password should contain at least 8 characters\n',
      name: 'password_should_contain_at_least_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `. Password should contain at least one lowercase letter\n`
  String get password_should_contain_at_least_one_lowercase_letter {
    return Intl.message(
      '. Password should contain at least one lowercase letter\n',
      name: 'password_should_contain_at_least_one_lowercase_letter',
      desc: '',
      args: [],
    );
  }

  /// `. Password should contain at least one uppercase letter\n`
  String get password_should_contain_at_least_one_uppercase_letter {
    return Intl.message(
      '. Password should contain at least one uppercase letter\n',
      name: 'password_should_contain_at_least_one_uppercase_letter',
      desc: '',
      args: [],
    );
  }

  /// `. Password should contain at least one number\n`
  String get password_should_contain_at_least_one_number {
    return Intl.message(
      '. Password should contain at least one number\n',
      name: 'password_should_contain_at_least_one_number',
      desc: '',
      args: [],
    );
  }

  /// `. Password should contain at least one symbol\n`
  String get password_should_contain_at_least_one_symbol {
    return Intl.message(
      '. Password should contain at least one symbol\n',
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

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Register For New User`
  String get register_for_new_user {
    return Intl.message(
      'Register For New User',
      name: 'register_for_new_user',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `I Agree To The Terms Of Service And Privacy Policy`
  String get i_agree_terms_and_conditions {
    return Intl.message(
      'I Agree To The Terms Of Service And Privacy Policy',
      name: 'i_agree_terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Already Have An Account? `
  String get already_have_an_account {
    return Intl.message(
      'Already Have An Account? ',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Validate`
  String get validate {
    return Intl.message(
      'Validate',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verify_code {
    return Intl.message(
      'Verify Code',
      name: 'verify_code',
      desc: '',
      args: [],
    );
  }

  /// `We sent an OTP code on your Email.`
  String get we_sent_an_otp {
    return Intl.message(
      'We sent an OTP code on your Email.',
      name: 'we_sent_an_otp',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Hello In Your App`
  String get welcome_on_app {
    return Intl.message(
      'Hello In Your App',
      name: 'welcome_on_app',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Where’s Your\nNext Destination?`
  String get where_next {
    return Intl.message(
      'Where’s Your\nNext Destination?',
      name: 'where_next',
      desc: '',
      args: [],
    );
  }

  /// `Flights`
  String get flights {
    return Intl.message(
      'Flights',
      name: 'flights',
      desc: '',
      args: [],
    );
  }

  /// `Hotels`
  String get hotels {
    return Intl.message(
      'Hotels',
      name: 'hotels',
      desc: '',
      args: [],
    );
  }

  /// `Car Rental`
  String get car_rental {
    return Intl.message(
      'Car Rental',
      name: 'car_rental',
      desc: '',
      args: [],
    );
  }

  /// `One Way`
  String get one_way {
    return Intl.message(
      'One Way',
      name: 'one_way',
      desc: '',
      args: [],
    );
  }

  /// `Round Trip`
  String get round_trip {
    return Intl.message(
      'Round Trip',
      name: 'round_trip',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `Flying From`
  String get flying_from {
    return Intl.message(
      'Flying From',
      name: 'flying_from',
      desc: '',
      args: [],
    );
  }

  /// `Flying To`
  String get flying_to {
    return Intl.message(
      'Flying To',
      name: 'flying_to',
      desc: '',
      args: [],
    );
  }

  /// `Departure`
  String get departure {
    return Intl.message(
      'Departure',
      name: 'departure',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get return_flying {
    return Intl.message(
      'Return',
      name: 'return_flying',
      desc: '',
      args: [],
    );
  }

  /// `Travelers`
  String get travelers {
    return Intl.message(
      'Travelers',
      name: 'travelers',
      desc: '',
      args: [],
    );
  }

  /// `2 Adults, 3Children`
  String get travelers_hint {
    return Intl.message(
      '2 Adults, 3Children',
      name: 'travelers_hint',
      desc: '',
      args: [],
    );
  }

  /// `View More`
  String get view_more {
    return Intl.message(
      'View More',
      name: 'view_more',
      desc: '',
      args: [],
    );
  }

  /// `View Less`
  String get view_less {
    return Intl.message(
      'View Less',
      name: 'view_less',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Limited Offers`
  String get limited_offers {
    return Intl.message(
      'Limited Offers',
      name: 'limited_offers',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get view_all {
    return Intl.message(
      'View All',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get book_now {
    return Intl.message(
      'Book Now',
      name: 'book_now',
      desc: '',
      args: [],
    );
  }

  /// `Best Places`
  String get best_place {
    return Intl.message(
      'Best Places',
      name: 'best_place',
      desc: '',
      args: [],
    );
  }

  /// `Best Packages`
  String get best_packages {
    return Intl.message(
      'Best Packages',
      name: 'best_packages',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get people {
    return Intl.message(
      'People',
      name: 'people',
      desc: '',
      args: [],
    );
  }

  /// `Search for place and proprieties`
  String get search_for_place {
    return Intl.message(
      'Search for place and proprieties',
      name: 'search_for_place',
      desc: '',
      args: [],
    );
  }

  /// `Check In`
  String get check_in {
    return Intl.message(
      'Check In',
      name: 'check_in',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get check_out {
    return Intl.message(
      'Check Out',
      name: 'check_out',
      desc: '',
      args: [],
    );
  }

  /// `Guests`
  String get guests {
    return Intl.message(
      'Guests',
      name: 'guests',
      desc: '',
      args: [],
    );
  }

  /// `Pickup Location`
  String get pick_uo_location {
    return Intl.message(
      'Pickup Location',
      name: 'pick_uo_location',
      desc: '',
      args: [],
    );
  }

  /// `Drop-off Location`
  String get drop_off_location {
    return Intl.message(
      'Drop-off Location',
      name: 'drop_off_location',
      desc: '',
      args: [],
    );
  }

  /// `Final Destination`
  String get final_destination {
    return Intl.message(
      'Final Destination',
      name: 'final_destination',
      desc: '',
      args: [],
    );
  }

  /// `Different\nReturn`
  String get different_return {
    return Intl.message(
      'Different\nReturn',
      name: 'different_return',
      desc: '',
      args: [],
    );
  }

  /// `Cheap Price`
  String get cheap_price {
    return Intl.message(
      'Cheap Price',
      name: 'cheap_price',
      desc: '',
      args: [],
    );
  }

  /// `Stop Include`
  String get stop_include {
    return Intl.message(
      'Stop Include',
      name: 'stop_include',
      desc: '',
      args: [],
    );
  }

  /// `Show Details`
  String get show_details {
    return Intl.message(
      'Show Details',
      name: 'show_details',
      desc: '',
      args: [],
    );
  }

  /// `Hide Details`
  String get hide_details {
    return Intl.message(
      'Hide Details',
      name: 'hide_details',
      desc: '',
      args: [],
    );
  }

  /// `Travel Time`
  String get travel_time {
    return Intl.message(
      'Travel Time',
      name: 'travel_time',
      desc: '',
      args: [],
    );
  }

  /// `Arrived At Destination`
  String get arrived_at_destination {
    return Intl.message(
      'Arrived At Destination',
      name: 'arrived_at_destination',
      desc: '',
      args: [],
    );
  }

  /// `Select Flight`
  String get select_flight {
    return Intl.message(
      'Select Flight',
      name: 'select_flight',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Adults`
  String get adults {
    return Intl.message(
      'Adults',
      name: 'adults',
      desc: '',
      args: [],
    );
  }

  /// `Children`
  String get children {
    return Intl.message(
      'Children',
      name: 'children',
      desc: '',
      args: [],
    );
  }

  /// `h`
  String get h {
    return Intl.message(
      'h',
      name: 'h',
      desc: '',
      args: [],
    );
  }

  /// `m`
  String get m {
    return Intl.message(
      'm',
      name: 'm',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Skin`
  String get dark_skin {
    return Intl.message(
      'Dark Skin',
      name: 'dark_skin',
      desc: '',
      args: [],
    );
  }

  /// `Light Skin`
  String get light_skin {
    return Intl.message(
      'Light Skin',
      name: 'light_skin',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `User has Logged Out Successful`
  String get logout_successful {
    return Intl.message(
      'User has Logged Out Successful',
      name: 'logout_successful',
      desc: '',
      args: [],
    );
  }

  /// `Booking Successful`
  String get booking_successful {
    return Intl.message(
      'Booking Successful',
      name: 'booking_successful',
      desc: '',
      args: [],
    );
  }

  /// `We Will Send An Email With The Flight Information And Ticket.`
  String get we_will_send_an_email {
    return Intl.message(
      'We Will Send An Email With The Flight Information And Ticket.',
      name: 'we_will_send_an_email',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Your Flight Booking`
  String get your_flight_booking {
    return Intl.message(
      'Your Flight Booking',
      name: 'your_flight_booking',
      desc: '',
      args: [],
    );
  }

  /// `Customize`
  String get customize {
    return Intl.message(
      'Customize',
      name: 'customize',
      desc: '',
      args: [],
    );
  }

  /// `Passenger Info`
  String get passenger_info {
    return Intl.message(
      'Passenger Info',
      name: 'passenger_info',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Traveler`
  String get traveler {
    return Intl.message(
      'Traveler',
      name: 'traveler',
      desc: '',
      args: [],
    );
  }

  /// `Adult`
  String get adult {
    return Intl.message(
      'Adult',
      name: 'adult',
      desc: '',
      args: [],
    );
  }

  /// `Child`
  String get child {
    return Intl.message(
      'Child',
      name: 'child',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Birth Of Date`
  String get birth_of_date {
    return Intl.message(
      'Birth Of Date',
      name: 'birth_of_date',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email Address`
  String get enter_your_email_address {
    return Intl.message(
      'Enter Your Email Address',
      name: 'enter_your_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Booking Confirmation Will Be Sent To This Email Address.`
  String get booking_confirmation_will_be_sent {
    return Intl.message(
      'Booking Confirmation Will Be Sent To This Email Address.',
      name: 'booking_confirmation_will_be_sent',
      desc: '',
      args: [],
    );
  }

  /// `Passport Details`
  String get passport_details {
    return Intl.message(
      'Passport Details',
      name: 'passport_details',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Details Exactly As They Appear On Your Passport/Travel Document`
  String get please_enter_details_exactly {
    return Intl.message(
      'Please Enter Details Exactly As They Appear On Your Passport/Travel Document',
      name: 'please_enter_details_exactly',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get passport_number {
    return Intl.message(
      'Passport Number',
      name: 'passport_number',
      desc: '',
      args: [],
    );
  }

  /// `Your Passport Number`
  String get your_passport_number {
    return Intl.message(
      'Your Passport Number',
      name: 'your_passport_number',
      desc: '',
      args: [],
    );
  }

  /// `Your Mobile Number`
  String get your_mobile_number {
    return Intl.message(
      'Your Mobile Number',
      name: 'your_mobile_number',
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
