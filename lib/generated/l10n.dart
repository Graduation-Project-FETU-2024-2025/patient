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

  /// `All Services for your health`
  String get onboarding {
    return Intl.message(
      'All Services for your health',
      name: 'onboarding',
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

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
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

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get loginToYourAccount {
    return Intl.message(
      'Login to your account',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get doNotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'doNotHaveAnAccount',
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

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOTP {
    return Intl.message(
      'Enter OTP',
      name: 'enterOTP',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP sent to`
  String get enterOTPSentTo {
    return Intl.message(
      'Enter OTP sent to',
      name: 'enterOTPSentTo',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive OTP?`
  String get dontReceiveOTP {
    return Intl.message(
      'Didn\'t receive OTP?',
      name: 'dontReceiveOTP',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resendOTP {
    return Intl.message(
      'Resend OTP',
      name: 'resendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `OTP sent successfully`
  String get otpSent {
    return Intl.message(
      'OTP sent successfully',
      name: 'otpSent',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new password to reset the password on your account. We'll ask for this password whenever you log in.`
  String get enterNewPassword {
    return Intl.message(
      'Enter a new password to reset the password on your account. We\'ll ask for this password whenever you log in.',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
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

  /// `Birthday`
  String get Birthday {
    return Intl.message(
      'Birthday',
      name: 'Birthday',
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

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Please select your gender`
  String get Pleaseselectyourgender {
    return Intl.message(
      'Please select your gender',
      name: 'Pleaseselectyourgender',
      desc: '',
      args: [],
    );
  }

  /// `Create your new account`
  String get createYourNewAccount {
    return Intl.message(
      'Create your new account',
      name: 'createYourNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get someThingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'someThingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully`
  String get passwordResetSuccess {
    return Intl.message(
      'Password reset successfully',
      name: 'passwordResetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Specialities`
  String get specialities {
    return Intl.message(
      'Specialities',
      name: 'specialities',
      desc: '',
      args: [],
    );
  }

  /// `About Doctor`
  String get aboutDoctor {
    return Intl.message(
      'About Doctor',
      name: 'aboutDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Booking Price`
  String get bookingPrice {
    return Intl.message(
      'Booking Price',
      name: 'bookingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Make Appointment`
  String get makeAnAppointment {
    return Intl.message(
      'Make Appointment',
      name: 'makeAnAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Medical specialties`
  String get medicalSpecialites {
    return Intl.message(
      'Medical specialties',
      name: 'medicalSpecialites',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Highly Recommended`
  String get highlyRecommended {
    return Intl.message(
      'Highly Recommended',
      name: 'highlyRecommended',
      desc: '',
      args: [],
    );
  }

  /// `Doctors`
  String get doctors {
    return Intl.message(
      'Doctors',
      name: 'doctors',
      desc: '',
      args: [],
    );
  }

  /// `Available Appointments : `
  String get avaliableAppointments {
    return Intl.message(
      'Available Appointments : ',
      name: 'avaliableAppointments',
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

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
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

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
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

  /// `Medicine Records`
  String get medicineRecord {
    return Intl.message(
      'Medicine Records',
      name: 'medicineRecord',
      desc: '',
      args: [],
    );
  }

  /// `Order Log`
  String get orderLog {
    return Intl.message(
      'Order Log',
      name: 'orderLog',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Patient History`
  String get patientHistory {
    return Intl.message(
      'Patient History',
      name: 'patientHistory',
      desc: '',
      args: [],
    );
  }

  /// `General Info`
  String get generalInfo {
    return Intl.message(
      'General Info',
      name: 'generalInfo',
      desc: '',
      args: [],
    );
  }

  /// `gender`
  String get gender {
    return Intl.message(
      'gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Last Visit`
  String get lastVisit {
    return Intl.message(
      'Last Visit',
      name: 'lastVisit',
      desc: '',
      args: [],
    );
  }

  /// `Date of Visit`
  String get DateOfVisit {
    return Intl.message(
      'Date of Visit',
      name: 'DateOfVisit',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis`
  String get diagnosis {
    return Intl.message(
      'Diagnosis',
      name: 'diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `Chief Complaint`
  String get chiefComplaint {
    return Intl.message(
      'Chief Complaint',
      name: 'chiefComplaint',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Request`
  String get appointmentRequest {
    return Intl.message(
      'Appointment Request',
      name: 'appointmentRequest',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get patientComment {
    return Intl.message(
      'Comment',
      name: 'patientComment',
      desc: '',
      args: [],
    );
  }

  /// `No appointments available`
  String get noAppointment {
    return Intl.message(
      'No appointments available',
      name: 'noAppointment',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet`
  String get noOrdersYet {
    return Intl.message(
      'No orders yet',
      name: 'noOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Book Appointment`
  String get bookAppointment {
    return Intl.message(
      'Book Appointment',
      name: 'bookAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Comment & Notes`
  String get commentAndNotes {
    return Intl.message(
      'Comment & Notes',
      name: 'commentAndNotes',
      desc: '',
      args: [],
    );
  }

  /// `write a note`
  String get writeNote {
    return Intl.message(
      'write a note',
      name: 'writeNote',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Successfully!`
  String get successfully {
    return Intl.message(
      'Successfully!',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully completed the reservation process`
  String get completeReservation {
    return Intl.message(
      'You have successfully completed the reservation process',
      name: 'completeReservation',
      desc: '',
      args: [],
    );
  }

  /// `Write a comment...`
  String get writeComment {
    return Intl.message(
      'Write a comment...',
      name: 'writeComment',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Add Rate`
  String get addRate {
    return Intl.message(
      'Add Rate',
      name: 'addRate',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Add review successfully`
  String get addreviewSuccessfully {
    return Intl.message(
      'Add review successfully',
      name: 'addreviewSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Attach Analysis`
  String get attachAnalysis {
    return Intl.message(
      'Attach Analysis',
      name: 'attachAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `No visit yet`
  String get noVisitYet {
    return Intl.message(
      'No visit yet',
      name: 'noVisitYet',
      desc: '',
      args: [],
    );
  }

  /// `Search Medicines`
  String get searchHint {
    return Intl.message(
      'Search Medicines',
      name: 'searchHint',
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
