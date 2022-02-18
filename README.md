# Animated Login

## Author: [Bahrican Yesil](https://github.com/bahricanyesil)

[![Pub](https://img.shields.io/pub/v/animated_login.svg)](https://pub.dartlang.org/packages/animated_login)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

`Animated Login` for Flutter is a ready-made login/signup screen with soft and pleasant animations.
It is fully responsive to be able to use on both web and mobile apps. You can welcome your users with this beautiful animated screen that gives functionality for both login and sign up.

<br/>

## Web View Example Video

![Web View](https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/web_view.gif)

## Mobile View Example Video

<img src="https://raw.githubusercontent.com/bahricanyesil/flutter-animated-login/master/screenshots/mobile_view.gif" height="500">

<br/>

## Installation

You can follow the instructions for installation [here](https://pub.dev/packages/animated_login/install)

## Reference

| Property                  | Type                                      | Description                                                                                                                                                 |
| ------------------------- | ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| onSignup                  | `SignupCallback`                          | Signup callback that will be called after signup button pressed.                                                                                            |
| onLogin                   | `LoginCallback`                           | Login callback that will be called after login button pressed.                                                                                              |
| socialLogins              | [`List<SocialLogin>`](#SocialLogin)       | List of social login options that will be provided.                                                                                                         |
| loginTexts                | [`LoginTexts`](#LoginTexts)               | Determines all of the texts on the screen.                                                                                                                  |
| loginDesktopTheme         | [`LoginViewTheme`](#LoginViewTheme)       | Determines all of the theme related things for desktop view.                                                                                                |
| loginMobileTheme          | [`LoginViewTheme`](#LoginViewTheme)       | Determines all of the theme related things for mobile view.                                                                                                 |
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
| logo                      | `Widget`                                  | Custom widget to display a logo. Its size is constrained.                                                                                                   |
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

### LoginViewTheme

| Property                  | Type                                          | Description                                                                          |
| ------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------------ |
| formTitleStyle            | `TextStyle`                                   | Text style for the title of form part.                                               |
| welcomeTitleStyle         | `TextStyle`                                   | Text style for the title of welcome part.                                            |
| welcomeDescriptionStyle   | `TextStyle`                                   | Text style for the description of welcome part.                                      |
| changeActionStyle         | `TextStyle`                                   | Text style for the change action CTA of welcome part.                                |
| useEmailStyle             | `TextStyle`                                   | Text style for the use email text of form part.                                      |
| forgotPasswordStyle       | `TextStyle`                                   | Text style for the forgot password CTA of form part.                                 |
| hintTextStyle             | `TextStyle`                                   | Text style for hint texts in the text form fields.                                   |
| errorTextStyle            | `TextStyle`                                   | Text style for error texts in the text form fields.                                  |
| textFormStyle             | `TextStyle`                                   | Text style for input texts in the text form fields.                                  |
| textFormFieldDeco         | `InputDecoration`                             | Input decoration for the text form fields.                                           |
| nameIcon                  | `Widget`                                      | Prefix widget for name text form field.                                              |
| emailIcon                 | `Widget`                                      | Prefix widget for email text form field.                                             |
| passwordIcon              | `Widget`                                      | Prefix widget for password text form field.                                          |
| formFieldElevation        | `double`                                      | Elevation for text form fields.                                                      |
| formFieldBackgroundColor  | `Color`                                       | Background color for text form fields.                                               |
| formFieldShadowColor      | `Color`                                       | Shadow color for text form fields.                                                   |
| formFieldBorderRadius     | `BorderRadius`                                | Border radius for text form fields.                                                  |
| formFieldSize             | `Size`                                        | Size of text form fields.                                                            |
| formFieldHoverColor       | `Color`                                       | Hover color for text form fields.                                                    |
| backgroundColor           | `Color`                                       | Background color of the login screen.                                                |
| errorBorderColor          | `Color`                                       | Error border color for text form fields.                                             |
| focusedErrorBorderColor   | `Color`                                       | Focused error border color for text form fields.                                     |
| focusedBorderColor        | `Color`                                       | Focused border color for text form fields.                                           |
| enabledBorderColor        | `Color`                                       | Enabled border color for text form fields.                                           |
| enabledBorder             | `InputBorder`                                 | Enabled border for text form fields.                                                 |
| errorBorder               | `InputBorder`                                 | Error border for text form fields.                                                   |
| focusedErrorBorder        | `InputBorder`                                 | Focused error border for text form fields.                                           |
| focusedBorder             | `InputBorder`                                 | Focused border for text form fields.                                                 |
| showFormFieldErrors       | `bool`                                        | Indicates whether the error messages should be displayed below the text form fields. |
| showLabelTexts            | `bool`                                        | Indicates whether the labels should be displayed above the text form fields.         |
| socialLoginHoverColor     | `Color`                                       | Hover color for social login widgets.                                                |
| socialLoginBorder         | `BorderSide`                                  | Border for social login widgets.                                                     |
| changeLangButtonStyle     | `ButtonStyle`                                 | Custom button style for change language button.                                      |
| changeLangContentColor    | `Color`                                       | Custom color for change language button text and icon.                               |
| changeLangButtonTextStyle | `TextStyle`                                   | Custom text style for change language button text.                                   |
| animationCurve            | `Curve`                                       | Custom animation curve that will be used for animations.                             |
| formWidthRatio            | `double`                                      | Ratio of width of the form to the width of the screen.                               |
| animationDuration         | `Duration`                                    | The duration of the animations.                                                      |
| formElementsSpacing       | `double`                                      | The spacing between the elements of form.                                            |
| socialLoginsSpacing       | `double`                                      | The spacing between the social login options.                                        |
| actionButtonStyle         | `ButtonStyle`                                 | Custom button style for action button (login/signup).                                |
| changeActionButtonStyle   | `ButtonStyle`                                 | Custom button style for change action button that will switch auth mode.             |
| welcomePadding            | `EdgeInsets`                                  | Padding of the welcome part widget.                                                  |
| formPadding               | `EdgeInsets`                                  | Padding of the form part widget.                                                     |
| logoSize                  | `Size`                                        | Size of the logo in the welcome part.                                                |
| dialogTheme               | [`AnimatedDialogTheme`](#AnimatedDialogTheme) | Theme preferences for dialogs.                                                       |

### AnimatedDialogTheme

| Property              | Type                                          | Description                                                       |
| --------------------- | --------------------------------------------- | ----------------------------------------------------------------- |
| contentPadding        | `EdgeInsets`                                  | The padding for content of the dialogs.                           |
| actionsPadding        | `EdgeInsets`                                  | The padding for actions of the dialogs.                           |
| contentSize           | `Size`                                        | Size of the content widget.                                       |
| contentTextStyle      | `TextStyle`                                   | Text style of the content text.                                   |
| contentTextAlign      | `TextAlign`                                   | Text alignment of the content text.                               |
| actionTextStyle       | `TextStyle`                                   | Text style of the action text.                                    |
| onPressed             | `VoidCallback`                                | Action will be performed on click to action button of the dialog. |
| contentBoxConstraints | `BoxConstraints`                              | Box constraints, size limitations of the content widget, if any.  |
| shape                 | `ShapeBorder`                                 | Shape of the dialog.                                              |
| elevation             | `double`                                      | Elevation of the dialog.                                          |
| backgroundColor       | `Color`                                       | Background color of the dialog.                                   |
| animationDuration     | `Duration`                                    | Duration of display animation of the dialog.                      |
| languageDialogTheme   | [`LanguageDialogTheme`](#LanguageDialogTheme) | Theme of the language dialog, determines its style.               |

### LanguageDialogTheme

| Property                | Type               | Description                                 |
| ----------------------- | ------------------ | ------------------------------------------- |
| title                   | `Widget`           | Title of the choose langauge dialog.        |
| dialogOptionSize        | `Size`             | Size of the dialog option.                  |
| optionMargin            | `EdgeInsets`       | Margin of the dialog option.                |
| optionPadding           | `EdgeInsets`       | Padding of the dialog option.               |
| selectedBackgroundColor | `Color`            | Background color of the selected option.    |
| iconColor               | `Color`            | Color of the language icon.                 |
| languageTextStyle       | `TextStyle`        | Text style for language text.               |
| selectedItemTextColor   | `Color`            | Text color for selected language item.      |
| dividerThemeData        | `DividerThemeData` | Theme for divider between language options. |

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

### Comprehensive example

```dart
class LoginScreen extends StatefulWidget {
  /// Simulates the multilanguage, you will implement your own logic.
  /// According to the current language, you can display a text message
  /// with the help of [LoginTexts] class.
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LanguageOption language = _languageOptions[1];
  AuthMode currentMode = AuthMode.login;

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      onLogin: LoginFunctions(context).onLogin,
      onSignup: LoginFunctions(context).onSignup,
      onForgotPassword: LoginFunctions(context).onForgotPassword,
      logo: Image.asset('assets/images/logo.gif'),
      // backgroundImage: 'images/background_image.jpg',
      signUpMode: SignUpModes.both,
      socialLogins: _socialLogins(context),
      loginDesktopTheme: _desktopTheme,
      loginMobileTheme: _mobileTheme,
      loginTexts: _loginTexts,
      changeLanguageCallback: (LanguageOption? _language) {
        if (_language != null) {
          DialogBuilder(context).showResultDialog(
              'Successfully changed the language to: ${_language.value}.');
          if (mounted) setState(() => language = _language);
        }
      },
      languageOptions: _languageOptions,
      selectedLanguage: language,
      initialMode: currentMode,
      onAuthModeChange: (AuthMode newMode) => currentMode = newMode,
    );
  }

  static List<LanguageOption> get _languageOptions => const <LanguageOption>[
        LanguageOption(
          value: 'Turkish',
          code: 'TR',
          iconPath: 'assets/images/tr.png',
        ),
        LanguageOption(
          value: 'English',
          code: 'EN',
          iconPath: 'assets/images/en.png',
        ),
      ];

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *DESKTOP* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _desktopTheme => _mobileTheme.copyWith(
        // To set the color of button text, use foreground color.
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        dialogTheme: const AnimatedDialogTheme(
          languageDialogTheme: LanguageDialogTheme(
              optionMargin: EdgeInsets.symmetric(horizontal: 80)),
        ),
      );

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *MOBILE* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _mobileTheme => LoginViewTheme(
        // showLabelTexts: false,
        backgroundColor: Colors.blue, // const Color(0xFF6666FF),
        formFieldBackgroundColor: Colors.white,
        formWidthRatio: 60,
        // actionButtonStyle: ButtonStyle(
        //   foregroundColor: MaterialStateProperty.all(Colors.blue),
        // ),
      );

  LoginTexts get _loginTexts => LoginTexts(
        nameHint: _username,
        login: _login,
        signUp: _signup,
      );

  /// You can adjust the texts in the screen according to the current language
  /// With the help of [LoginTexts], you can create a multilanguage scren.
  String get _username => language.code == 'TR' ? 'Kullanıcı Adı' : 'Username';

  String get _login => language.code == 'TR' ? 'Giriş Yap' : 'Login';

  String get _signup => language.code == 'TR' ? 'Kayıt Ol' : 'Sign Up';

  /// Social login options, you should provide callback function and icon path.
  /// Icon paths should be the full path in the assets
  /// Don't forget to also add the icon folder to the "pubspec.yaml" file.
  List<SocialLogin> _socialLogins(BuildContext context) => <SocialLogin>[
        SocialLogin(
            callback: () async => LoginFunctions(context).socialLogin('Google'),
            iconPath: 'assets/images/google.png'),
        SocialLogin(
            callback: () async =>
                LoginFunctions(context).socialLogin('Facebook'),
            iconPath: 'assets/images/facebook.png'),
        SocialLogin(
            callback: () async =>
                LoginFunctions(context).socialLogin('Linkedin'),
            iconPath: 'assets/images/linkedin.png'),
      ];
}

class LoginFunctions {
  /// Collection of functions will be performed on login/signup.
  /// * e.g. [onLogin], [onSignup], [socialLogin], and [onForgotPassword]
  const LoginFunctions(this.context);
  final BuildContext context;

  /// Login action that will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilder(context).showResultDialog('Successful login.');
    return null;
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilder(context).showResultDialog('Successful sign up.');
    return null;
  }

  /// Social login callback example.
  Future<String?> socialLogin(String type) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilder(context)
        .showResultDialog('Successful social login with $type.');
    return null;
  }

  /// Action that will be performed on click to "Forgot Password?" text/CTA.
  /// Probably you will navigate user to a page to create a new password after the verification.
  Future<String?> onForgotPassword(String email) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    // You should determine this path and create the screen.
    // Navigator.of(context).pushNamed('/forgotPass');
    return null;
  }
}

class DialogBuilder {
  /// Builds various dialogs with different methods.
  /// * e.g. [showLoadingDialog], [showResultDialog]
  const DialogBuilder(this.context);
  final BuildContext context;

  /// Example loading dialog
  Future<void> showLoadingDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: const AlertDialog(
            content:  SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        ),
      );

  /// Example result dialog
  Future<void> showResultDialog(String text) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: 100,
            width: 100,
            child: Center(child: Text(text, textAlign: TextAlign.center)),
          ),
        ),
      );
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
