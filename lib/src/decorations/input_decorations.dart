import 'package:flutter/material.dart';

import '../constants/border/border_radii.dart';
import '../responsiveness/dynamic_size.dart';
import '../utils/device_type_helper.dart';
import '../widgets/icons/base_icon.dart';

class InputDeco {
  InputDeco(this.context) {
    isLandscape = DeviceTypeHelper(context).isLandscape;
    dynamicSize = DynamicSize(context);
    theme = Theme.of(context);
  }
  final BuildContext context;
  late final bool isLandscape;
  late final DynamicSize dynamicSize;
  late final ThemeData theme;

  InputDecoration loginDeco({
    String? hintText,
    IconData? prefixIcon,
    Color? backgroundColor,
    double paddingFactor = .7,
  }) =>
      InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: dynamicSize.width * paddingFactor),
        hintText: hintText,
        hintStyle: _hintTextStyle,
        enabledBorder: _getOutlineBorder(.5, 1),
        focusedBorder: _getOutlineBorder(1.1, 1),
        prefixIcon: getPrefixIcon(prefixIcon),
      );

  Widget? getPrefixIcon(IconData? prefixIcon) => prefixIcon == null
      ? null
      : BaseIcon(prefixIcon, widthFactor: isLandscape ? 2.1 : 3);

  InputDecoration dialogText(
          {required String hintText, double? verticalPadding}) =>
      InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: dynamicSize.height * (verticalPadding ?? 2),
          horizontal: dynamicSize.width * 1.8,
        ),
        hintText: hintText,
        hintStyle: theme.textTheme.headline5!
            .copyWith(color: theme.primaryColorLight.withOpacity(.8)),
        enabledBorder: _getOutlineBorder(.5, .8),
        focusedBorder: _getOutlineBorder(1.1, 1),
      );

  OutlineInputBorder _getOutlineBorder(double width, double opacity) =>
      OutlineInputBorder(
        borderRadius: BorderRadii.mediumCircular,
        borderSide: BorderSide(
          width: width,
          color: theme.primaryColorLight.withOpacity(opacity),
        ),
      );

  TextStyle get _hintTextStyle =>
      (isLandscape ? theme.textTheme.headline5 : theme.textTheme.bodyText2)!
          .copyWith(color: theme.primaryColorDark);
}
