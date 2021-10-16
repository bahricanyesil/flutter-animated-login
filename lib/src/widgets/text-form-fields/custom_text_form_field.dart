import 'package:flutter/material.dart';

import '../../decorations/input_decorations.dart';
import '../../utils/device_type_helper.dart';
import 'text_form_field_wrapper.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double? widthFactor;
  final double? heightFactor;
  const CustomTextFormField({
    required this.controller,
    this.padding,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor,
    this.heightFactor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseTextFormFieldWrapper(
        formField: TextFormField(
          controller: controller,
          style: _textStyle(context),
          decoration: _getFormDeco(context),
          expands: true,
          maxLines: null,
        ),
        backgroundColor: backgroundColor,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        padding: padding,
      );

  InputDecoration _getFormDeco(BuildContext context) =>
      InputDeco(context).loginDeco(
        hintText: hintText,
        prefixIcon: prefixIcon,
        backgroundColor: backgroundColor,
      );

  TextStyle _textStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return (DeviceTypeHelper(context).isLandscape
            ? theme.textTheme.headline5
            : theme.textTheme.bodyText2)!
        .copyWith(color: Colors.black87);
  }
}
