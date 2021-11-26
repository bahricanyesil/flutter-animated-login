import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/input_decorations.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import '../buttons/base_icon_button.dart';
import 'text_form_field_wrapper.dart';

class ObscuredTextFormField extends StatefulWidget {
  /// Base obscured [TextFormField] wrapped with [BaseTextFormFieldWrapper].
  /// It is specialized for obscured text form fields.
  /// Implements login decoration as default, can be customized with params.
  /// Used for implementation of passwrod and confirm password text form fields.
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
  final TextEditingController controller;
  final bool showPasswordVisibility;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double? widthFactor;
  final TextInputAction textInputAction;
  final Function(String text)? onFieldSubmitted;
  final void Function(String? text) onChanged;
  final FocusNode? focusNode;
  final FormFieldValidator<String?>? validator;

  @override
  _ObscuredTextFormFieldState createState() => _ObscuredTextFormFieldState();
}

class _ObscuredTextFormFieldState extends State<ObscuredTextFormField> {
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
