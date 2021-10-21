import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_theme.dart';
import '../responsiveness/dynamic_size.dart';
import '../widgets/icons/base_icon.dart';
import 'text_styles.dart';

/// [InputDeco] class collects all input decorations in one file.
class InputDeco {
  /// Initializes dynamicSize and theme fields after got the context.
  InputDeco(this.context) {
    dynamicSize = DynamicSize(context);
  }
  final BuildContext context;
  late final DynamicSize dynamicSize;

  /// [InputDecoration] for the text form fields in the login screen.
  /// Both "CustomTextFormField" and "ObscuredTextFormField" uses this deco.
  InputDecoration loginDeco({
    String? hintText,
    String? labelText,
    double paddingFactor = 1,
    IconData? prefixIcon,
    Widget? prefixWidget,
  }) {
    bool isWeb = false;
    final LoginTheme loginTheme = context.read<LoginTheme>();
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        horizontal: dynamicSize.width * paddingFactor,
        vertical: dynamicSize.height * 3.3,
      ),
      fillColor: loginTheme.formFieldBackgroundColor ??
          loginTheme.backgroundColor?.withOpacity(.8) ??
          Colors.white54,
      hoverColor: loginTheme.formFieldHoverColor ??
          Theme.of(context).primaryColorLight.withOpacity(.1),
      hintText: hintText,
      hintStyle:
          TextStyles(context).hintTextStyle().merge(loginTheme.hintTextStyle),
      labelText: isWeb
          ? loginTheme.showLabelTexts
              ? hintText
              : null
          : null,
      labelStyle:
          TextStyles(context).hintTextStyle().merge(loginTheme.hintTextStyle),
      errorMaxLines: 1,
      errorStyle:
          TextStyles(context).errorTextStyle().merge(loginTheme.errorTextStyle),
      enabledBorder: loginTheme.enabledBorder ??
          _getOutlineBorder(loginTheme.enabledBorderColor, isWeb,
              widthFactor: .4),
      focusedBorder: loginTheme.focusedBorder ??
          _getOutlineBorder(loginTheme.focusedBorderColor, isWeb),
      focusedErrorBorder: loginTheme.focusedErrorBorder ??
          _getOutlineBorder(loginTheme.focusedErrorBorderColor, isWeb),
      errorBorder: loginTheme.errorBorder ??
          _getOutlineBorder(loginTheme.errorBorderColor ?? Colors.red, isWeb,
              widthFactor: .4),
      prefixIcon: prefixWidget ?? getPrefixIcon(prefixIcon),
      filled: true,
    );
  }

  /// Returns the prefix icon if there is any provided.
  Widget? getPrefixIcon(IconData? prefixIcon) => prefixIcon == null
      ? null
      : Padding(
          padding: EdgeInsets.only(left: dynamicSize.width * .6),
          child: BaseIcon(prefixIcon, sizeFactor: 7),
        );

  /// Default function returns [OutlineInputBorder] with some common values.
  /// Takes [color] and [widthFactor] as parameters to specialize each border.
  OutlineInputBorder _getOutlineBorder(Color? color, bool isWeb,
          {double widthFactor = .62}) =>
      OutlineInputBorder(
        borderRadius: context.read<LoginTheme>().formFieldBorderRadius ??
            const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: DynamicSize(context).responsiveSize * widthFactor,
          color: color ??
              (isWeb ? Theme.of(context).primaryColorLight : Colors.white),
        ),
      );
}
