import 'package:flutter/material.dart';

import '../constants/border/border_radii.dart';
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
    IconData? prefixIcon,
    Color? backgroundColor,
    double paddingFactor = .6,
  }) =>
      InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: dynamicSize.width * paddingFactor),
        hintText: hintText,
        hintStyle: TextStyles(context).hintTextStyle(),
        enabledBorder: _getOutlineBorder(.5, 1),
        focusedBorder: _getOutlineBorder(1.1, 1),
        prefixIcon: getPrefixIcon(prefixIcon),
      );

  Widget? getPrefixIcon(IconData? prefixIcon) => prefixIcon == null
      ? null
      : Padding(
          padding: EdgeInsets.only(left: dynamicSize.width * .6),
          child: BaseIcon(prefixIcon, widthFactor: 2.1),
        );

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
}
