import 'package:flutter/material.dart';

import '../utils/validators.dart';

@immutable

/// [ValidatorModel] is to determine options for validations.
class ValidatorModel {
  /// You can set you own custom validator with [customValidator] or
  /// you can make some customization on the default validation.
  const ValidatorModel({
    this.customValidator,
    this.length,
    this.checkUpperCase = false,
    this.checkLowerCase = false,
    this.checkSpace = false,
    this.checkNumber = false,
    this.validatorCallback,
  });

  /// Custom validator for the text field. If it is provided,
  /// then all fields below will be inactivated and
  /// form will be validated to the custom validator.
  final FormFieldValidator<String?>? customValidator;

  /// Minimum required length for the text. If not provided,
  /// default values for email, password and name will be used.
  final int? length;

  /// Indicates whether the text should contain upper case character.
  final bool checkUpperCase;

  /// Indicates whether the text should contain lower case character.
  final bool checkLowerCase;

  /// Indicates whether the text can contain space or not.
  final bool checkSpace;

  /// Indicates whether the text should contain a number.
  final bool checkNumber;

  /// Validator callback to customize the error message for email/password/name.
  final ValidatorMessageCallback? validatorCallback;
}
