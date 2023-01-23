import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../constants/enums/auth_mode.dart';
import '../constants/enums/sign_up_modes.dart';
import '../models/models_shelf.dart';
import '../utils/validators.dart';

/// It is called on auth mode changes,
/// triggered by [Auth.switchAuth] method.
typedef AuthModeChangeCallback = void Function(AuthMode authMode);

/// [Auth] is the provider for auth related data, functions.
class Auth extends ChangeNotifier {
  /// Manages the state related to the authentication modes.
  Auth({
    required GlobalKey<FormState> formKey,
    this.socialLogins = const <SocialLogin>[],
    this.onAuthModeChange,
    this.validateName = true,
    this.validateEmail = true,
    this.validatePassword = true,
    this.validateCheckbox = true,
    this.showPasswordVisibility = true,
    this.checkboxCallback,
    bool hasPrivacyPolicy = false,
    ValidatorModel? nameValidator,
    ValidatorModel? emailValidator,
    ValidatorModel? passwordValidator,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    AuthMode? initialMode,
    LoginCallback? onLogin,
    SignupCallback? onSignup,
    ForgotPasswordCallback? onForgotPassword,
    SignUpModes? signUpMode,
  })  : _formKey = formKey,
        _signUpMode = signUpMode ?? SignUpModes.both,
        _nameController = nameController ?? TextEditingController(text: ''),
        _emailController = emailController ?? TextEditingController(text: ''),
        _passwordController =
            passwordController ?? TextEditingController(text: ''),
        _confirmPasswordController =
            confirmPasswordController ?? TextEditingController(text: ''),
        _nameValidator = nameValidator,
        _emailValidator = emailValidator,
        _passwordValidator = passwordValidator,
        _hasPrivacyPolicy = hasPrivacyPolicy {
    _onLogin = onLogin ?? _defaultLoginFunc;
    _onSignup = onSignup ?? _defaultSignupFunc;
    _onForgotPassword = onForgotPassword ?? _defaultForgotPassFunc;
    _mode = initialMode ?? AuthMode.login;
    _initialMode = initialMode ?? AuthMode.login;
  }

  /// Default login, signup and forgot password functions to be
  /// called in case any custom functions are not provided.
  Future<String?> _defaultLoginFunc(LoginData a) async => null;
  Future<String?> _defaultSignupFunc(SignUpData a) async => null;
  Future<String?> _defaultForgotPassFunc(String e) async => null;

  /// checkboxCallback
  ValueChanged<bool?>? checkboxCallback;

  /// Callback to use auth mode changes.
  final AuthModeChangeCallback? onAuthModeChange;

  late final LoginCallback _onLogin;

  /// Function to be called on login action.
  LoginCallback get onLogin => _onLogin;

  late final SignupCallback _onSignup;

  /// Function to be called on signup action.
  SignupCallback get onSignup => _onSignup;

  late final ForgotPasswordCallback _onForgotPassword;

  /// Function to be called on click to forgot password text.
  ForgotPasswordCallback get onForgotPassword => _onForgotPassword;

  /// List of social login options.
  final List<SocialLogin>? socialLogins;

  bool _checkedPrivacyBox = false;
  bool _showCheckboxError = false;
  final bool _hasPrivacyPolicy;

  late AuthMode _mode;
  late AuthMode _initialMode;

  /// Current authentication mode of the screen.
  AuthMode get mode => _mode;

  /// Uses [AuthMode] enum's values.
  void notifySetMode(AuthMode value) {
    if (value.index != mode.index) {
      _mode = value;
      notifyListeners();
    }
  }

  /// Returns whether the current [_mode] is login or signup mode.
  bool get isLogin => _mode == AuthMode.login;

  /// Returns whether the current [_mode] is login or signup mode.
  bool get isSignup => _mode == AuthMode.signup;

  /// Switches the authentication mode and notify the listeners.
  AuthMode switchAuth() {
    notifySetMode(isLogin ? AuthMode.signup : AuthMode.login);
    if (onAuthModeChange != null) onAuthModeChange!(mode);
    return mode;
  }

  bool _isReverse = true;

  /// Indicates whether the screen animation is reverse mode.
  bool get isReverse => _isReverse;

  /// Indicates whether the box is checked.
  bool get checkedPrivacyBox => _checkedPrivacyBox;

  /// Indicates whether to show checkbox error.
  bool get showCheckboxError => _showCheckboxError;

  /// Combination of isReverse and initial mode values.
  bool get isAnimatedLogin => !_isReverse ^ (_initialMode == AuthMode.login);

  /// Username in the text controller.
  String? username;

  /// Email user entered in the text controller.
  String? email;

  /// Password text in the text controller.
  String? password;

  /// Confirm password text in the text controller.
  String? confirmPassword;

  /// Sets the username.
  void setUsername(String? newUsername) => username = newUsername;

  /// Sets the email.
  void setEmail(String? newEmail) => email = newEmail;

  /// Sets the password.
  void setPassword(String? newPassword) => password = newPassword;

  /// Sets the checkbox.
  void setCheckedPrivacyPolicy(bool? newValue) {
    if (checkboxCallback != null) checkboxCallback!(newValue);
    if (newValue == null || newValue == _checkedPrivacyBox) return;
    _checkedPrivacyBox = newValue;
    notifyListeners();
  }

  /// Sets whether to show checkbox error.
  void setShowCheckboxError(bool? newValue) {
    if (newValue == null || newValue == _showCheckboxError) return;
    _showCheckboxError = newValue;
    notifyListeners();
  }

  /// Sets the confirm password.
  void setConfirmPassword(String? newConfirmPassword) =>
      confirmPassword = newConfirmPassword;

  /// Sets the confirm password.
  void setIsReverse(bool newValue) {
    if (newValue != _isReverse) {
      _isReverse = newValue;
      notifyListeners();
    }
  }

  /// Cancelable operation for auth operations.
  CancelableOperation<dynamic>? cancelableOperation;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  /// Custom input validator for name field.
  final ValidatorModel? _nameValidator;

  /// Custom input validator for email field.
  final ValidatorModel? _emailValidator;

  /// Custom input validator for password field.
  final ValidatorModel? _passwordValidator;

  /// Indicates whether the name field should be validated.
  final bool validateName;

  /// Indicates whether the email field should be validated.
  final bool validateEmail;

  /// Indicates whether the password fields should be validated.
  final bool validatePassword;

  /// Indicates whether the checkbox should be validated.
  final bool validateCheckbox;

  /// Indicates whether the user can show the password text without obscuring.
  final bool showPasswordVisibility;

  final SignUpModes _signUpMode;

  /// Sets the email value.
  void setEmailValue(String? value) =>
      _emailController.value = TextEditingValue(text: value ?? '');

  /// Sets the password value.
  void setPasswordValue(String? value) =>
      _passwordController.value = TextEditingValue(text: value ?? '');

  /// Sets the username value.
  void setUsernameValue(String? value) =>
      _nameController.value = TextEditingValue(text: value ?? '');

  /// Sets the confirm password value.
  void setConfirmPasswordValue(String? value) =>
      _confirmPasswordController.value = TextEditingValue(text: value ?? '');

  /// Optional TextEditingController for name input field.
  TextEditingController get nameController => _nameController;

  /// Optional TextEditingController for email input field.
  TextEditingController get emailController => _emailController;

  /// Optional TextEditingController for password input field.
  TextEditingController get passwordController => _passwordController;

  /// Optional TextEditingController for confirm password input field.
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  /// Enum to determine which text form fields should be displayed in addition
  /// to the email and password fields: Name / Confirm Password / Both
  SignUpModes get signUpMode => _signUpMode;

  final GlobalKey<FormState> _formKey;

  /// The form key that will be assigned to the form.
  GlobalKey<FormState> get formKey => _formKey;

  /// Callback for the social login actions.
  Future<void> socialLoginCallback(int index) async {
    await socialLogins![index].callback();
  }

  /// Any login or signup action.
  Future<void> action() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      if (isLogin) {
        await _loginResult();
      } else if (isSignup) {
        await _signupResult();
      }
    }
  }

  Future<String?> _loginResult() async {
    final LoginData loginData = LoginData(
      email: _emailController.text,
      password: _passwordController.text,
    );
    return onLogin(loginData);
  }

  Future<String?> _signupResult() async {
    final SignUpData signupData = SignUpData(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );
    if (validateCheckbox && _hasPrivacyPolicy) {
      if (!_checkedPrivacyBox) {
        setShowCheckboxError(true);
        return 'Please agree to the Privacy Policy and Terms & Conditions';
      } else {
        setShowCheckboxError(false);
      }
    }
    return onSignup(signupData);
  }

  /// Name validator.
  FormFieldValidator<String?>? get nameValidator => validateName
      ? (_nameValidator?.customValidator ??
          Validators(validator: _nameValidator).name)
      : null;

  /// Email validator.
  FormFieldValidator<String?>? get emailValidator => validateEmail
      ? (_emailValidator?.customValidator ??
          Validators(validator: _emailValidator).email)
      : null;

  /// Password validator.
  FormFieldValidator<String?>? get passwordValidator => validatePassword
      ? (_passwordValidator?.customValidator ??
          Validators(
            validator: _passwordValidator ??
                const ValidatorModel(
                  checkLowerCase: true,
                  checkUpperCase: true,
                  checkNumber: true,
                  checkSpace: true,
                ),
          ).password)
      : null;
}
