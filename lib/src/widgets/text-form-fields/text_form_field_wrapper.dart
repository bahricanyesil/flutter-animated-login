import 'package:flutter/material.dart';

import '../../constants/border/border_radii.dart';
import '../../responsiveness/dynamic_size.dart';

class BaseTextFormFieldWrapper extends StatelessWidget {
  final TextFormField formField;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? widthFactor;
  final double? heightFactor;
  const BaseTextFormFieldWrapper({
    required this.formField,
    this.padding,
    this.backgroundColor,
    this.widthFactor,
    this.heightFactor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    final ThemeData theme = Theme.of(context);
    return Material(
      elevation: 5,
      color: backgroundColor ?? theme.canvasColor,
      shadowColor: theme.primaryColorDark,
      borderRadius: BorderRadii.mediumCircular,
      child: Container(
        width: dynamicSize.width * (widthFactor ?? 35),
        height: dynamicSize.height * (heightFactor ?? 10),
        padding: padding ?? EdgeInsets.zero,
        child: formField,
      ),
    );
  }
}
