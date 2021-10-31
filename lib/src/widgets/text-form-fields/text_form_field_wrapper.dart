import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';

/// Base [TextFormField] wrapper to manage the size values in one place.
/// Directly implements the given width and avoids exceeding a specific height.
class BaseTextFormFieldWrapper extends StatelessWidget {
  const BaseTextFormFieldWrapper({
    required this.formField,
    this.widthFactor,
    Key? key,
  }) : super(key: key);
  final TextFormField formField;
  final double? widthFactor;

  @override
  Widget build(BuildContext context) {
    final LoginTheme loginTheme = context.read<LoginTheme>();
    final DynamicSize dynamicSize = DynamicSize(context);
    final bool isLandscape = loginTheme.isLandscape;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: loginTheme.formFieldSize?.width ??
            dynamicSize.width * (widthFactor ?? (isLandscape ? 35 : 75)),
      ).enforce(
        BoxConstraints(
          maxHeight: loginTheme.formFieldSize?.height ??
              dynamicSize.height * (isLandscape ? 12 : 10),
        ),
      ),
      child: formField,
    );
  }
}
