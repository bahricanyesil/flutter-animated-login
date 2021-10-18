import 'package:animated_login/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/input_decorations.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import '../buttons/base_icon_button.dart';
import 'text_form_field_wrapper.dart';

class ObscuredTextFormField extends StatefulWidget {
  const ObscuredTextFormField({
    required this.controller,
    this.showPasswordVisibility = true,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor,
    this.heightFactor,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final bool showPasswordVisibility;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double? widthFactor;
  final double? heightFactor;

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
        validator: theme.showFormFieldErrors ? Validators.password : null,
        style: TextStyles(context).textFormStyle().merge(theme.textFormStyle),
        obscureText: !_isVisible,
        decoration: theme.textFormFieldDeco ?? _formDeco,
      ),
      heightFactor: widget.heightFactor,
      widthFactor: widget.widthFactor,
    );
  }

  InputDecoration get _formDeco => widget.showPasswordVisibility
      ? _invisibleDeco.copyWith(suffixIcon: _suffixIcon)
      : _invisibleDeco;

  InputDecoration get _invisibleDeco => InputDeco(context).loginDeco(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        prefixWidget: context.read<LoginTheme>().passwordIcon,
      );

  Widget get _suffixIcon => BaseIconButton(
        icon: _isVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        onPressed: _changeVisibility,
      );

  void _changeVisibility() => setState(() => _isVisible = !_isVisible);
}
