import 'package:animated_login/src/providers/login_theme.dart';
import 'package:animated_login/src/responsiveness/dynamic_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Base [TextFormField] wrapper to manage the size values in one place.
class BaseTextFormFieldWrapper extends StatelessWidget {
  /// Implements the given width and avoids exceeding a specific height.
  const BaseTextFormFieldWrapper({
    required this.formField,
    this.widthFactor,
    Key? key,
  }) : super(key: key);

  /// Form field.
  final TextFormField formField;

  /// Width factor.
  final double? widthFactor;

  @override
  Widget build(BuildContext context) {
    final loginTheme = context.read<LoginTheme>();
    final dynamicSize = DynamicSize(context);
    final isLandscape = loginTheme.isLandscape;
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
