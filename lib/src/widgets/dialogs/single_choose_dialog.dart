import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';
import '../../models/language_dialog_theme.dart';
import '../../models/language_option.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

/// Choose dialog with multiple options but single selection.
class SingleChooseDialog extends StatelessWidget {
  /// Choose dialog with multiple options but single selection.
  const SingleChooseDialog({
    required this.elements,
    this.initialValue,
    this.theme,
    Key? key,
  }) : super(key: key);

  /// Elements of the dialog.
  final List<LanguageOption> elements;

  /// Default initial value.
  final LanguageOption? initialValue;

  /// Customized optional theme for the dialog.
  final LanguageDialogTheme? theme;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(
          elements.length,
          (int index) => Column(
            children: <Widget>[
              if (index == 0) _getDivider(context),
              _getSimpleDialogOption(index, context),
              _getDivider(context),
            ],
          ),
        ),
      );

  Widget _getSimpleDialogOption(int index, BuildContext context) => Container(
        height: theme?.dialogOptionSize?.height ??
            DynamicSize(context).height * 5.5,
        width: theme?.dialogOptionSize?.width,
        margin: theme?.optionMargin ??
            EdgeInsets.symmetric(
                horizontal: DynamicSize(context).responsiveSize * 2),
        padding: theme?.optionPadding ??
            EdgeInsets.symmetric(
                vertical: DynamicSize(context).responsiveSize * .5),
        child: Material(
          color: initialValue == elements[index]
              ? (theme?.selectedBackgroundColor ??
                  Theme.of(context).primaryColor.withOpacity(.7))
              : Colors.transparent,
          child: SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(index),
            child: elements[index].iconPath == null
                ? _languageText(context, index)
                : _buttonChild(context, index),
          ),
        ),
      );

  Widget _buttonChild(BuildContext context, int index) {
    final double responsiveSize = DynamicSize(context).responsiveSize;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: responsiveSize * .8),
          child: Image.asset(
            elements[index].iconPath!,
            color: theme?.iconColor,
          ),
        ),
        SizedBox(width: responsiveSize * 5),
        _languageText(context, index),
      ],
    );
  }

  Widget _languageText(BuildContext context, int index) => BaseText(
        elements[index].value.toString(),
        style: TextStyles(context)
            .subBodyStyle(
              color: initialValue == elements[index]
                  ? Colors.white
                  : Theme.of(context).primaryColor,
            )
            .merge(theme?.languageTextStyle)
            .copyWith(
              color: initialValue == elements[index]
                  ? theme?.selectedItemTextColor
                  : null,
            ),
      );

  Widget _getDivider(BuildContext context) => DividerTheme(
        data: theme?.dividerThemeData ?? _defaultDividerTheme(context),
        child: const Divider(),
      );

  DividerThemeData _defaultDividerTheme(BuildContext context) =>
      DividerThemeData(
        color: Theme.of(context).primaryColor,
        thickness: DynamicSize(context).responsiveSize * .1,
      );
}
