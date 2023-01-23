/// Components of the login screen to be able to order them customly.
enum LoginComponents {
  /// Title of the login screen.
  title,

  /// Title of the form.
  formTitle,

  /// Social logins.
  socialLogins,

  /// Description of the login screen.
  description,

  /// Form component. Includes email, password and etc.
  form,

  /// Main action button, either login or signup.
  actionButton,

  /// Change action text button, either login or signup.
  /// Prefixed with "Already have an account?" or "Not have an account?" texts.
  changeActionButton,

  /// Forgot password action button.
  forgotPassword,

  /// Logo of the app.
  logo,

  /// Not have an account text.
  notHaveAnAccount,

  /// Use email text.
  useEmail,

  /// Checkbox for privacy policy and terms&conditions.
  policyCheckbox,
}
