import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/input_decorations.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import '../buttons/base_icon_button.dart';
import 'text_form_field_wrapper.dart';

/// Base obscured [TextFormField] wrapped with [BaseTextFormFieldWrapper].
class ObscuredTextFormField extends StatefulWidget {
  /// It is specialized for obscured text form fields.
  /// Implements login decoration as default, can be customized with params.
  /// Used for implementation of password and confirm password text form fields.
  const ObscuredTextFormField({
    required this.controller,
    required this.onChanged,
    this.showPasswordVisibility = true,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    Key? key,
  }) : super(key: key);

  /// Controller for the text form field.
  final TextEditingController controller;

  /// Validator of the text field.
  final FormFieldValidator<String?>? validator;

  /// Callback to call on text change.
  final void Function(String? text) onChanged;

  /// Hint text of the field.
  final String? hintText;

  /// Prefix icon.
  final IconData? prefixIcon;

  /// Background color of the field.
  final Color? backgroundColor;

  /// Width factor.
  final double? widthFactor;

  /// Custom text input action.
  final TextInputAction textInputAction;

  /// Bool represents whether to show password.
  final bool showPasswordVisibility;

  /// Callback to call when the input is submitted.
  final Function(String text)? onFieldSubmitted;

  /// Focus node to control the focus on the field.
  final FocusNode? focusNode;

  @override
  ObscuredTextFormFieldState createState() => ObscuredTextFormFieldState();
}

/// State of the obscured text form field widget.
class ObscuredTextFormFieldState extends State<ObscuredTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final LoginTheme theme = context.read<LoginTheme>();
    return BaseTextFormFieldWrapper(
      formField: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        style: TextStyles(context).textFormStyle().merge(theme.textFormStyle),
        obscureText: !_isVisible,
        decoration: theme.textFormFieldDeco ?? _formDeco,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const <String>[
          AutofillHints.password,
          AutofillHints.newPassword
        ],
      ),
      widthFactor: widget.widthFactor,
    );
  }

  /// Gets the corresponding input decoration by checking whether
  /// the show password functionality is enabled.
  InputDecoration get _formDeco => widget.showPasswordVisibility
      ? _invisibleDeco.copyWith(suffixIcon: _suffixIcon)
      : _invisibleDeco;

  InputDecoration get _invisibleDeco => InputDeco(context).loginDeco(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        prefixWidget: context.read<LoginTheme>().passwordIcon,
        paddingFactor: context.read<LoginTheme>().isLandscape ? .7 : 0.2,
      );

  /// Suffix icon to change the visibility of password.
  Widget get _suffixIcon => BaseIconButton(
        icon: _isVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        onPressed: _changeVisibility,
      );

  /// Changes the visibility of password, and reloads the widget.
  void _changeVisibility() {
    if (mounted) setState(() => _isVisible = !_isVisible);
  }
}
