import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';

class BaseTextFormFieldWrapper extends StatelessWidget {
  const BaseTextFormFieldWrapper({
    required this.formField,
    this.widthFactor,
    this.heightFactor,
    Key? key,
  }) : super(key: key);
  final TextFormField formField;
  final double? widthFactor;
  final double? heightFactor;

  @override
  Widget build(BuildContext context) {
    final LoginTheme loginTheme = context.read<LoginTheme>();
    final DynamicSize dynamicSize = DynamicSize(context);
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: loginTheme.formFieldSize?.width ??
            dynamicSize.width * (widthFactor ?? 35),
      ).enforce(
        BoxConstraints(
          maxHeight:
              loginTheme.formFieldSize?.height ?? dynamicSize.height * 12,
        ),
      ),
      child: formField,
    );
  }
}
