import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @onboardingOneTitle.
  ///
  /// In en, this message translates to:
  /// **'Comfortable Space'**
  String get onboardingOneTitle;

  /// No description provided for @onboardingOneDescription.
  ///
  /// In en, this message translates to:
  /// **'Enjoy a space that offers comfort and relaxation, where smart design meets serene ambiance.'**
  String get onboardingOneDescription;

  /// No description provided for @onboardingTwoTitle.
  ///
  /// In en, this message translates to:
  /// **'Modern Design'**
  String get onboardingTwoTitle;

  /// No description provided for @onboardingTwoDescription.
  ///
  /// In en, this message translates to:
  /// **'A modern design that blends elegance and functionality, creating a perfect environment for your lifestyle.'**
  String get onboardingTwoDescription;

  /// No description provided for @onboardingThreeTitle.
  ///
  /// In en, this message translates to:
  /// **'Styled Living'**
  String get onboardingThreeTitle;

  /// No description provided for @onboardingThreeDescription.
  ///
  /// In en, this message translates to:
  /// **'Live in style with details designed for a luxurious and distinctive experience.'**
  String get onboardingThreeDescription;

  /// No description provided for @onboardingFourTitle.
  ///
  /// In en, this message translates to:
  /// **'Relaxing Furniture'**
  String get onboardingFourTitle;

  /// No description provided for @onboardingFourDescription.
  ///
  /// In en, this message translates to:
  /// **'Every corner is designed to provide unparalleled comfort, making you feel at home in your own world.'**
  String get onboardingFourDescription;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPassword;

  /// No description provided for @forgetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPasswordButton;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterEmail;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @userNameOrEmail.
  ///
  /// In en, this message translates to:
  /// **'UserName or Email'**
  String get userNameOrEmail;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailAddress;

  /// No description provided for @emailValue.
  ///
  /// In en, this message translates to:
  /// **'example@example.com'**
  String get emailValue;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @setPassword.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get setPassword;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change the Password'**
  String get changePassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @passwordValue.
  ///
  /// In en, this message translates to:
  /// **'********'**
  String get passwordValue;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @mobileNumberValue.
  ///
  /// In en, this message translates to:
  /// **'+123 456 789'**
  String get mobileNumberValue;

  /// No description provided for @dateOFBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOFBirth;

  /// No description provided for @dateOFBirthValue.
  ///
  /// In en, this message translates to:
  /// **'DD / MM /YYY'**
  String get dateOFBirthValue;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginTitle;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcomeSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter your details to proceed.'**
  String get welcomeSubTitle;

  /// No description provided for @orMethod.
  ///
  /// In en, this message translates to:
  /// **'or sign up with'**
  String get orMethod;

  /// No description provided for @haveNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get haveNoAccount;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @licences.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to '**
  String get licences;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use '**
  String get termsOfUse;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and '**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy.'**
  String get privacyPolicy;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back.'**
  String get welcomeBack;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
