import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';
import '../../models/language_option.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

class SingleChooseDialog extends StatelessWidget {
  final String title;
  final List<LanguageOption> elements;
  final LanguageOption? initialValue;
  const SingleChooseDialog({
    required this.title,
    required this.elements,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: BaseText(
          title,
          style: TextStyles(context).subtitleTextStyle(
              color: Theme.of(context).primaryColor.withOpacity(.7)),
        ),
        children: _getDialogChildren(context),
      );

  List<Widget> _getDialogChildren(BuildContext context) =>
      List<Widget>.generate(
        elements.length,
        (int index) => Column(
          children: <Widget>[
            if (index == 0) _getDivider(context),
            _getSimpleDialogOption(index, context),
            _getDivider(context),
          ],
        ),
      );

  Widget _getSimpleDialogOption(int index, BuildContext context) => Container(
        height: DynamicSize(context).height * 5.5,
        margin: EdgeInsets.symmetric(
            horizontal: DynamicSize(context).responsiveSize * 2),
        padding: EdgeInsets.symmetric(
            vertical: DynamicSize(context).responsiveSize * .5),
        color: initialValue == elements[index]
            ? Theme.of(context).primaryColor.withOpacity(.7)
            : null,
        child: SimpleDialogOption(
          padding: EdgeInsets.symmetric(
              vertical: DynamicSize(context).responsiveSize * 1.5),
          onPressed: () => Navigator.of(context).pop(index),
          child: elements[index].iconPath == null
              ? _languageText(context, index)
              : _buttonChild(context, index),
        ),
      );

  Widget _buttonChild(BuildContext context, int index) {
    final double responsiveSize = DynamicSize(context).responsiveSize;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: responsiveSize * .8),
          child: Image.asset(elements[index].iconPath!),
        ),
        SizedBox(width: responsiveSize * 5),
        _languageText(context, index),
      ],
    );
  }

  Widget _languageText(BuildContext context, int index) => BaseText(
        elements[index].value.toString(),
        style: TextStyles(context).subBodyStyle(
          color: initialValue == elements[index]
              ? Colors.white
              : Theme.of(context).primaryColor,
        ),
      );

  Widget _getDivider(BuildContext context) => Divider(
        color: Theme.of(context).primaryColor,
        thickness: DynamicSize(context).responsiveSize * .1,
      );
}
