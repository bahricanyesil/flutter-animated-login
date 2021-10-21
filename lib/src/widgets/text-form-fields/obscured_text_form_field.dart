import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/input_decorations.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import '../../utils/validators.dart';
import '../buttons/base_icon_button.dart';
import 'text_form_field_wrapper.dart';

/// Base obscured [TextFormField] wrapped with [BaseTextFormFieldWrapper].
/// It is specialized for obscured text form fields.
/// Implements login decoration as default, can be customized with parameteres.
/// Used for implementation of passwrod and confirm password text form fields.
class ObscuredTextFormField extends StatefulWidget {
  const ObscuredTextFormField({
    required this.controller,
    this.showPasswordVisibility = true,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor,
    this.textInputAction = TextInputAction.done,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final bool showPasswordVisibility;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double? widthFactor;
  final TextInputAction textInputAction;

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
        key: Key(widget.controller.toString()),
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        validator: theme.showFormFieldErrors ? Validators.password : null,
        style: TextStyles(context).textFormStyle().merge(theme.textFormStyle),
        obscureText: !_isVisible,
        decoration: theme.textFormFieldDeco ?? _formDeco,
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
      );

  /// Suffix icon to change the visibility of password.
  Widget get _suffixIcon => BaseIconButton(
        icon: _isVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        onPressed: _changeVisibility,
      );

  /// Changes the visibility of password, and reloads the widget.
  void _changeVisibility() => setState(() => _isVisible = !_isVisible);
}
