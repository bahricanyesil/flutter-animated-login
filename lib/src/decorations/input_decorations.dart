import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/border/border_radii.dart';
import '../providers/login_theme.dart';
import '../responsiveness/dynamic_size.dart';
import '../widgets/icons/base_icon.dart';
import 'text_styles.dart';

class InputDeco {
  InputDeco(this.context) {
    dynamicSize = DynamicSize(context);
    theme = Theme.of(context);
  }
  final BuildContext context;
  late final DynamicSize dynamicSize;
  late final ThemeData theme;

  InputDecoration loginDeco({
    String? hintText,
    String? labelText,
    double paddingFactor = 1,
    IconData? prefixIcon,
    Widget? prefixWidget,
  }) {
    final LoginTheme theme = context.read<LoginTheme>();
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        horizontal: dynamicSize.width * paddingFactor,
        vertical: dynamicSize.height * 3.3,
      ),
      fillColor: theme.formFieldBackgroundColor ??
          theme.backgroundColor?.withOpacity(.8) ??
          Colors.white54,
      hoverColor: theme.formFieldHoverColor ??
          Theme.of(context).primaryColorLight.withOpacity(.1),
      hintText: hintText,
      hintStyle: theme.hintTextStyle ?? TextStyles(context).hintTextStyle(),
      labelText: theme.showLabelTexts ? hintText : null,
      labelStyle: theme.hintTextStyle ?? TextStyles(context).hintTextStyle(),
      errorMaxLines: 1,
      errorStyle: theme.errorTextStyle ?? TextStyles(context).errorTextStyle(),
      enabledBorder: theme.enabledBorder ??
          _getOutlineBorder(theme.enabledBorderColor, widthFactor: .4),
      focusedBorder:
          theme.focusedBorder ?? _getOutlineBorder(theme.focusedBorderColor),
      focusedErrorBorder: theme.focusedErrorBorder ??
          _getOutlineBorder(theme.focusedErrorBorderColor),
      errorBorder: theme.errorBorder ??
          _getOutlineBorder(theme.errorBorderColor ?? Colors.red,
              widthFactor: .4),
      prefixIcon: prefixWidget ?? getPrefixIcon(prefixIcon),
      filled: true,
    );
  }

  Widget? getPrefixIcon(IconData? prefixIcon) => prefixIcon == null
      ? null
      : Padding(
          padding: EdgeInsets.only(left: dynamicSize.width * .6),
          child: BaseIcon(prefixIcon, widthFactor: 7),
        );

  OutlineInputBorder _getOutlineBorder(Color? color,
          {double widthFactor = .62}) =>
      OutlineInputBorder(
        borderRadius: context.read<LoginTheme>().formFieldBorderRadius ??
            BorderRadii.mediumCircular,
        borderSide: BorderSide(
          width: DynamicSize(context).fontSize * widthFactor,
          color: color ?? theme.primaryColorLight,
        ),
      );
}
