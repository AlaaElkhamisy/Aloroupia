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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Aloroupia`
  String get aloroupia {
    return Intl.message('Aloroupia', name: 'aloroupia', desc: '', args: []);
  }

  /// `Welcome To The Best Quality`
  String get welcomeToTheBestQuality {
    return Intl.message(
      'Welcome To The Best Quality',
      name: 'welcomeToTheBestQuality',
      desc: '',
      args: [],
    );
  }

  /// `Choose What's Good For You`
  String get chooseWhatsGood {
    return Intl.message(
      'Choose What\'s Good For You',
      name: 'chooseWhatsGood',
      desc: '',
      args: [],
    );
  }

  /// `let's Start and Pick Up your Awesome Collections`
  String get letStartAndPickUp {
    return Intl.message(
      'let\'s Start and Pick Up your Awesome Collections',
      name: 'letStartAndPickUp',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `LogIn`
  String get logIn {
    return Intl.message('LogIn', name: 'logIn', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Login to your account`
  String get logInToYourAccount {
    return Intl.message(
      'Login to your account',
      name: 'logInToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgoyYourPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgoyYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign In With`
  String get orSignInWith {
    return Intl.message(
      'Or Sign In With',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Date Of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date Of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Rest Your Password`
  String get restYourPassword {
    return Intl.message(
      'Rest Your Password',
      name: 'restYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Classic`
  String get classic {
    return Intl.message('Classic', name: 'classic', desc: '', args: []);
  }

  /// `Modern`
  String get modern {
    return Intl.message('Modern', name: 'modern', desc: '', args: []);
  }

  /// `New Classic`
  String get newClassic {
    return Intl.message('New Classic', name: 'newClassic', desc: '', args: []);
  }

  /// `Contact Us`
  String get contact {
    return Intl.message('Contact Us', name: 'contact', desc: '', args: []);
  }

  /// `About App`
  String get aboutApp {
    return Intl.message('About App', name: 'aboutApp', desc: '', args: []);
  }

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `skip`
  String get skip {
    return Intl.message('skip', name: 'skip', desc: '', args: []);
  }

  /// `Login now`
  String get logInNow {
    return Intl.message('Login now', name: 'logInNow', desc: '', args: []);
  }

  /// `Confirm Your Account`
  String get confirmYourAccount {
    return Intl.message(
      'Confirm Your Account',
      name: 'confirmYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Send Pin Code To`
  String get sendPinCodeTo {
    return Intl.message(
      'Send Pin Code To',
      name: 'sendPinCodeTo',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get cOntinue {
    return Intl.message('Continue', name: 'cOntinue', desc: '', args: []);
  }

  /// `Enter The 4 Digit Numbers`
  String get enterPinCode {
    return Intl.message(
      'Enter The 4 Digit Numbers',
      name: 'enterPinCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter The 4 Digit Code Sent To You`
  String get enterTheFour4Sent {
    return Intl.message(
      'Enter The 4 Digit Code Sent To You',
      name: 'enterTheFour4Sent',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Offer`
  String get offer {
    return Intl.message('Offer', name: 'offer', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Read More`
  String get readMore {
    return Intl.message('Read More', name: 'readMore', desc: '', args: []);
  }

  /// `Read Less`
  String get readLess {
    return Intl.message('Read Less', name: 'readLess', desc: '', args: []);
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
