/// Sign up modes to determine which text form fields should be displayed.
enum SignUpModes {
  /// [name] only displays name text form field, not displays confirm password.
  name,

  /// [confirmPassword] only displays confirm password form field, not name.
  confirmPassword,

  /// [both] displays both name and confirm password text form fields.
  both,
}
