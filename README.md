# Animated Login

## Author: [Bahrican Yesil](https://github.com/bahricanyesil)

[![Pub](https://img.shields.io/pub/v/animated_login.svg)](https://pub.dartlang.org/packages/animated_login)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

`Animated Login` for Flutter is a ready-made login/signup screen with soft and pleasant animations.
It is fully responsive to be able to use on both web and mobile apps. You can welcome your users with this beautiful animated screen that gives functionality for both login and sign up.

## Web View Example Video

![Web View](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/web_view.gif)

## Mobile View Example Video

![Mobile View](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/mobile_view.gif)

## Installation

You can follow the instructions for installation [here](https://pub.dev/packages/animated_login/install)

## Reference

| Property                  | Type                                      | Description                                                                                                                                                 |
| ------------------------- | ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| onSignup                  | `SignupCallback`                          | Signup callback that will be called after signup button pressed.                                                                                            |
| onLogin                   | `LoginCallback`                           | Login callback that will be called after login button pressed.                                                                                              |
| socialLogins              | [`List<SocialLogin>`](#SocialLogin)       | List of social login options that will be provided.                                                                                                         |
| loginTexts                | [`LoginTexts`](#LoginTexts)               | Determines all of the texts on the screen.                                                                                                                  |
| loginTheme                | [`LoginTheme`](#LoginTheme)               | Determines all of the theme related variables on the screen.                                                                                                |
| onForgotPassword          | `ForgotPasswordCallback`                  | Callback that will be called after on tap of forgot password text. Commonly it navigates user to a screen to reset the password.                            |
| formKey                   | `GlobalKey<FormState>`                    | The optional custom form key, if not provided will be created locally.                                                                                      |
| checkError                | `bool`                                    | Indicates whether the login screen should handle errors, show the error messages returned from the callbacks in a dialog.                                   |
| showForgotPassword        | `bool`                                    | Indicates whether the forgot password option will be enabled.                                                                                               |
| showChangeActionTitle     | `bool`                                    | Indicates whether the change action title should be displayed.                                                                                              |
| showPasswordVisibility    | `bool`                                    | Indicates whether the user can show the password text without obscuring.                                                                                    |
| nameValidator             | [`ValidatorModel`](#ValidatorModel)       | Custom input validator for name field.                                                                                                                      |
| emailValidator            | [`ValidatorModel`](#ValidatorModel)       | Custom input validator for email field.                                                                                                                     |
| passwordValidator         | [`ValidatorModel`](#ValidatorModel)       | Custom input validator for password field.                                                                                                                  |
| validateName              | `bool`                                    | Indicates whether the name field should be validated.                                                                                                       |
| validateEmail             | `bool`                                    | Indicates whether the email field should be validated.                                                                                                      |
| validatePassword          | `bool`                                    | Indicates whether the password fields should be validated.                                                                                                  |
| nameController            | `TextEditingController`                   | Optional TextEditingController for name input field.                                                                                                        |
| emailController           | `TextEditingController`                   | Optional TextEditingController for email input field.                                                                                                       |
| passwordController        | `TextEditingController`                   | Optional TextEditingController for password input field.                                                                                                    |
| confirmPasswordController | `TextEditingController`                   | Optional TextEditingController for confirm password input field.                                                                                            |
| backgroundImage           | `String`                                  | Full asset image path for background of the welcome part.                                                                                                   |
| logo                      | `String`                                  | Full asset image path for the logo.                                                                                                                         |
| signUpMode                | [`SignUpModes`](#SignUpModes)             | Enum to determine which text form fields should be displayed in addition to the email and password fields: Name / Confirm Password / Both.                  |
| languageOptions           | [`List<LanguageOption>`](#LanguageOption) | List of languages that user can select.                                                                                                                     |
| changeLanguageCallback    | `ChangeLanguageCallback`                  | Callback that will be called when a language is selected.                                                                                                   |
| selectedLanguage          | [`LanguageOption`](#LanguageOption)       | Selected language that is stored in your side.                                                                                                              |
| changeLangOnPressed       | `ChangeLangOnPressedCallback`             | Optional function will be called on pressed to the change language button. It should prompt a dialog to select a language and return the selected language. |

### LoginTexts

| Property               | Type     | Description                                                              |
| ---------------------- | -------- | ------------------------------------------------------------------------ |
| welcome                | `String` | Welcome title in signUp mode for the informing part.                     |
| welcomeDescription     | `String` | Welcome description in signUp mode for the informing part.               |
| signUp                 | `String` | Action button text for sign up mode.                                     |
| signUpFormTitle        | `String` | Form title for sign up mode.                                             |
| signUpUseEmail         | `String` | Use email CTA for sign up mode.                                          |
| welcomeBack            | `String` | Welcome title in login mode for the informing part.                      |
| welcomeBackDescription | `String` | Welcome description in login mode for the informing part.                |
| login                  | `String` | Action button text for login mode.                                       |
| loginFormTitle         | `String` | Form title for login mode.                                               |
| loginUseEmail          | `String` | Use email CTA for login mode.                                            |
| forgotPassword         | `String` | Forgot password text for login mode.                                     |
| notHaveAnAccount       | `String` | Text above the sign up button to direct users who don't have an account. |
| alreadyHaveAnAccount   | `String` | Text above the login button to direct users who already have an account. |
| nameHint               | `String` | Hint text for name [TextFormField]                                       |
| emailHint              | `String` | Hint text for email [TextFormField]                                      |
| passwordHint           | `String` | Hint text for password [TextFormField]                                   |
| confirmPasswordHint    | `String` | Hint text for confirm password [TextFormField]                           |
| passwordMatchingError  | `String` | The error text for not matching password and confirm password inputs.    |
| dialogButtonText       | `String` | The button text of error dialog.                                         |
| chooseLanguageTitle    | `String` | The title of choose language dialog.                                     |

### LoginTheme

| Property                  | Type              | Description                                                                          |
| ------------------------- | ----------------- | ------------------------------------------------------------------------------------ |
| formTitleStyle            | `TextStyle`       | Text style for the title of form part.                                               |
| welcomeTitleStyle         | `TextStyle`       | Text style for the title of welcome part.                                            |
| welcomeDescriptionStyle   | `TextStyle`       | Text style for the description of welcome part.                                      |
| changeActionStyle         | `TextStyle`       | Text style for the change action CTA of welcome part.                                |
| useEmailStyle             | `TextStyle`       | Text style for the use email text of form part.                                      |
| forgotPasswordStyle       | `TextStyle`       | Text style for the forgot password CTA of form part.                                 |
| hintTextStyle             | `TextStyle`       | Text style for hint texts in the text form fields.                                   |
| errorTextStyle            | `TextStyle`       | Text style for error texts in the text form fields.                                  |
| textFormStyle             | `TextStyle`       | Text style for input texts in the text form fields.                                  |
| textFormFieldDeco         | `InputDecoration` | Input decoration for the text form fields.                                           |
| nameIcon                  | `Widget`          | Prefix widget for name text form field.                                              |
| emailIcon                 | `Widget`          | Prefix widget for email text form field.                                             |
| passwordIcon              | `Widget`          | Prefix widget for password text form field.                                          |
| formFieldElevation        | `double`          | Elevation for text form fields.                                                      |
| formFieldBackgroundColor  | `Color`           | Background color for text form fields.                                               |
| formFieldShadowColor      | `Color`           | Shadow color for text form fields.                                                   |
| formFieldBorderRadius     | `BorderRadius`    | Border radius for text form fields.                                                  |
| formFieldSize             | `Size`            | Size of text form fields.                                                            |
| formFieldHoverColor       | `Color`           | Hover color for text form fields.                                                    |
| backgroundColor           | `Color`           | Background color of the login screen.                                                |
| errorBorderColor          | `Color`           | Error border color for text form fields.                                             |
| focusedErrorBorderColor   | `Color`           | Focused error border color for text form fields.                                     |
| focusedBorderColor        | `Color`           | Focused border color for text form fields.                                           |
| enabledBorderColor        | `Color`           | Enabled border color for text form fields.                                           |
| enabledBorder             | `InputBorder`     | Enabled border for text form fields.                                                 |
| errorBorder               | `InputBorder`     | Error border for text form fields.                                                   |
| focusedErrorBorder        | `InputBorder`     | Focused error border for text form fields.                                           |
| focusedBorder             | `InputBorder`     | Focused border for text form fields.                                                 |
| showFormFieldErrors       | `bool`            | Indicates whether the error messages should be displayed below the text form fields. |
| showLabelTexts            | `bool`            | Indicates whether the labels should be displayed above the text form fields.         |
| socialLoginHoverColor     | `Color`           | Hover color for social login widgets.                                                |
| socialLoginBorder         | `BorderSide`      | Border for social login widgets.                                                     |
| changeLangButtonStyle     | `ButtonStyle`     | Custom button style for change language button.                                      |
| changeLangContentColor    | `Color`           | Custom color for change language button text and icon.                               |
| changeLangButtonTextStyle | `TextStyle`       | Custom text style for change language button text.                                   |
| animationCurve            | `Curve`           | Custom animation curve that will be used for animations.                             |
| formWidthRatio            | `double`          | Ratio of width of the form to the width of the screen.                               |
| animationDuration         | `Duration`        | The duration of the animations.                                                      |
| formElementsSpacing       | `double`          | The spacing between the elements of form.                                            |
| socialLoginsSpacing       | `double`          | The spacing between the social login options.                                        |
| actionButtonStyle         | `ButtonStyle`     | Custom button style for action button (login/signup).                                |
| changeActionButtonStyle   | `ButtonStyle`     | Custom button style for change action button that will switch auth mode.             |
| welcomePadding            | `EdgeInsets`      | Padding of the welcome part widget.                                                  |
| formPadding               | `EdgeInsets`      | Padding of the form part widget.                                                     |
| logoSize                  | `Size`            | Size of the logo in the welcome part.                                                |

### SocialLogin

| Property | Type                  | Description                                                          |
| -------- | --------------------- | -------------------------------------------------------------------- |
| iconPath | `String`              | Full asset path of the social platform logo.                         |
| callback | `SocialLoginCallback` | The callback will be called on click to logo of the social platform. |

### LoginData

| Property | Type     | Description                                                    |
| -------- | -------- | -------------------------------------------------------------- |
| email    | `String` | Email text the user entered to the email [TextFormField]       |
| password | `String` | Password text the user entered to the password [TextFormField] |

### SignUpData

| Property        | Type     | Description                                                                    |
| --------------- | -------- | ------------------------------------------------------------------------------ |
| name            | `String` | Name text the user entered to the name [TextFormField]                         |
| email           | `String` | Email text the user entered to the email [TextFormField]                       |
| password        | `String` | Password text the user entered to the password [TextFormField]                 |
| confirmPassword | `String` | Confirm password text the user entered to the confirm password [TextFormField] |

### LanguageOption

| Property     | Type     | Description                                                                        |
| ------------ | -------- | ---------------------------------------------------------------------------------- |
| languageCode | `String` | The abbrevation/code of the language option.                                       |
| value        | `String` | The complete name of the language option.                                          |
| iconPath     | `String` | Full asset path of the language option. Probably it will be the flag of a country. |

### ValidatorModel

| Property        | Type                          | Description                                                                                                                                           |
| --------------- | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| customValidator | `FormFieldValidator<String?>` | Custom validator for the text field. If it is provided, then all fields below will be inactivated and form will be validated to the custom validator. |
| length          | `int`                         | Minimum required length for the text. If not provided, default values for email, password and name will be used.                                      |
| checkUpperCase  | `bool`                        | Indicates whether the text should contain upper case character.                                                                                       |
| checkLowerCase  | `bool`                        | Indicates whether the text should contain lower case character.                                                                                       |
| checkSpace      | `bool`                        | Indicates whether the text can contain space or not.                                                                                                  |
| checkNumber     | `bool`                        | Indicates whether the text should contain a number.                                                                                                   |

### SignUpModes

| Enum            | Description                                                        |
| --------------- | ------------------------------------------------------------------ |
| name            | Only displays name text form field, not displays confirm password. |
| confirmPassword | Only displays confirm password form field, not name.               |
| both            | Displays both name and confirm password text form fields.          |

Sign up modes to determine which text form fields should be displayed.

## Complete Example

You can see the [complete example](https://github.com/bahricanyesil/flutter-animated-login/tree/master/example) in the example folder with the example project. The video recordings for the example project are shown above via gifs.

### Basic example

```dart
import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  /// Simulates the multilanguage, you will implement your own logic.
  /// According to the current language, you can display a text message
  /// with the help of [LoginTexts] class.
  final String langCode = 'en';

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      onLogin: onLogin,
      onSignup: onSignup,
      onForgotPassword: onForgotPassword,
      formWidthRatio: 60,
      logo: 'images/logo.gif',
      // backgroundImage: 'images/background_image.jpg',
      signUpMode: SignUpModes.both,
      loginTheme: _loginTheme,
      loginTexts: _loginTexts,
    );
  }

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginTheme get _loginTheme => LoginTheme(
        // showLabelTexts: false,
        backgroundColor: Colors.blue, // const Color(0xFF6666FF),
        formFieldBackgroundColor: Colors.white,
      );

  LoginTexts get _loginTexts => LoginTexts(
        nameHint: _username,
        login: _login,
        signUp: _signup,
      );

  /// You can adjust the texts in the screen according to the current language
  /// With the help of [LoginTexts], you can create a multilanguage scren.
  String get _username => langCode == 'tr' ? 'Kullanıcı Adı' : 'Username';
  String get _login => langCode == 'tr' ? 'Giriş Yap' : 'Login';
  String get _signup => langCode == 'tr' ? 'Kayıt Ol' : 'Sign Up';

  /// Login action that will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    await Future.delayed(const Duration(seconds: 2));
    print('Successfully logged in.');
    return null;
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData loginData) async {
    await Future.delayed(const Duration(seconds: 2));
    print('Successfully signed up.');
    return null;
  }

  /// Action that will be performed on click to "Forgot Password?" text/CTA.
  /// Probably you will navigate user to a page to create a new password after the verification.
  Future<String?> onForgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    print('Successfully navigated.');
    return null;
  }
}
```

### Basic example with social login options and data checks

```dart
import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  /// Simulates the multilanguage, you will implement your own logic.
  /// According to the current language, you can display a text message
  /// with the help of [LoginTexts] class.
  final String langCode = 'en';

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      onLogin: onLogin,
      onSignup: onSignup,
      onForgotPassword: onForgotPassword,
      formWidthRatio: 60,
      logo: 'images/logo.gif',
      // backgroundImage: 'images/background_image.jpg',
      signUpMode: SignUpModes.both,
      socialLogins: _socialLogins,
      loginTheme: _loginTheme,
      loginTexts: _loginTexts,
    );
  }

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginTheme get _loginTheme => LoginTheme(
        // showLabelTexts: false,
        backgroundColor: Colors.blue, // const Color(0xFF6666FF),
        formFieldBackgroundColor: Colors.white,
      );

  LoginTexts get _loginTexts => LoginTexts(
        nameHint: _username,
        login: _login,
        signUp: _signup,
      );

  /// You can adjust the texts in the screen according to the current language
  /// With the help of [LoginTexts], you can create a multilanguage scren.
  String get _username => langCode == 'tr' ? 'Kullanıcı Adı' : 'Username';
  String get _login => langCode == 'tr' ? 'Giriş Yap' : 'Login';
  String get _signup => langCode == 'tr' ? 'Kayıt Ol' : 'Sign Up';

  /// Social login options, you should provide callback function and icon path.
  /// Icon paths should be the full path in the assets
  /// Don't forget to also add the icon folder to the "pubspec.yaml" file.
  List<SocialLogin> get _socialLogins => <SocialLogin>[
        SocialLogin(
            callback: () async => socialLogin('Google'),
            iconPath: 'images/google.png'),
        SocialLogin(
            callback: () async => socialLogin('Facebook'),
            iconPath: 'images/facebook.png'),
        SocialLogin(
            callback: () async => socialLogin('Linkedin'),
            iconPath: 'images/linkedin.png'),
      ];

  /// Login action that will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    await Future.delayed(const Duration(seconds: 2));
    print("""
    Successfully logged in.\n
    Email: ${loginData.email}\n
    Password: ${loginData.password}""");
    return null;
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    await Future.delayed(const Duration(seconds: 2));
    print("""
    Successfully signed up.\n
    Username: ${signupData.name}\n
    Email: ${signupData.email}\n
    Password: ${signupData.password}\n
    Confirm Password: ${signupData.confirmPassword}""");
    return null;
  }

  /// Action that will be performed on click to "Forgot Password?" text/CTA.
  /// Probably you will navigate user to a page to create a new password after the verification.
  Future<String?> onForgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    print('Successfully navigated. Email is $email');
    return null;
  }

  /// Social login callback example.
  Future<String?> socialLogin(String type) async {
    await Future.delayed(const Duration(seconds: 2));
    print('Successfully logged in with $type.');
    return null;
  }
}
```

## More Screenshots

|                                                       Web Login                                                       |                                                        Mobile Login                                                         |
| :-------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------: |
| ![Web Login](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/web-login.png) | ![Mobile Login](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/mobile-login.png) |

|                                                        Web Sign Up                                                        |                                                         Mobile Sign Up                                                          |
| :-----------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------: |
| ![Web Sign Up](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/web-sign-up.png) | ![Mobile Sign Up](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/mobile-sign-up.png) |

|                                                        Color Change                                                         |                                                             Without Social Logins                                                             |
| :-------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------: |
| ![Color Change](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/color-change.png) | ![Without Social Logins](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/without-social-logins.png) |

|                                                         Error Example                                                         |
| :---------------------------------------------------------------------------------------------------------------------------: |
| ![Error Example](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/error-example.png) |

## Contributing

Contributions are so important for both me and those who want to use this package. I will be very appreciative if you allocate time to push forward the package.

All help is welcomed but if you have questions, bug reports, issues, feature requests, pull requests, etc, please first refer to the [Contributing Guide](https://github.com/bahricanyesil/flutter-animated-login/blob/master/contributing.md).

If you like and benefit from this package, please give us a [star on GitHub](https://github.com/bahricanyesil/flutter-animated-login/stargazers) and [like on pub.dev](https://pub.dev/packages/animated_login/score) to help!

## License

* MIT License
