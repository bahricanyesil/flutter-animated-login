import 'package:flutter/material.dart';

import '../../decorations/input_decorations.dart';
import '../../responsiveness/dynamic_size.dart';
import '../../utils/device_type_helper.dart';
import '../buttons/base_icon_button.dart';
import 'text_form_field_wrapper.dart';

class ObscuredTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double widthFactor;
  final double heightFactor;
  const ObscuredTextFormField({
    required this.controller,
    this.padding,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor = 35,
    this.heightFactor = 10,
    Key? key,
  }) : super(key: key);

  @override
  _ObscuredTextFormFieldState createState() => _ObscuredTextFormFieldState();
}

class _ObscuredTextFormFieldState extends State<ObscuredTextFormField> {
  bool _isVisible = false;
  late final bool isLandscape = DeviceTypeHelper(context).isLandscape;

  @override
  Widget build(BuildContext context) => BaseTextFormFieldWrapper(
        formField: TextFormField(
          controller: widget.controller,
          style: _textStyle(context),
          obscureText: !_isVisible,
          decoration: _formDeco,
        ),
        backgroundColor: widget.backgroundColor,
        heightFactor: widget.heightFactor,
        widthFactor: widget.widthFactor,
        padding: widget.padding,
      );

  InputDecoration get _formDeco => InputDeco(context)
      .loginDeco(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        backgroundColor: widget.backgroundColor,
        paddingFactor: 2.5,
      )
      .copyWith(suffixIcon: _suffixIcon);

  Widget get _suffixIcon => BaseIconButton(
        icon: _isVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        onPressed: _changeVisibility,
        size: DynamicSize(context).width * _suffixWidthFactor,
      );

  double get _suffixWidthFactor => widget.widthFactor / (isLandscape ? 4 : 6);

  TextStyle _textStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // TODO(bahrican): Write default textStyle instead of "!"
    return (isLandscape
            ? theme.textTheme.headline5
            : theme.textTheme.bodyText2)!
        .copyWith(color: Colors.black87);
  }

  void _changeVisibility() => setState(() => _isVisible = !_isVisible);
}
