import 'package:flutter/material.dart';

import '../../decorations/text_styles.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

class SingleChooseDialog<T> extends StatelessWidget {
  final String title;
  final List<T> elements;
  const SingleChooseDialog(
      {required this.title, required this.elements, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: BaseText(
          title,
          style: TextStyles(context).subtitleTextStyle(
              color: Theme.of(context).primaryColor.withOpacity(.7)),
        ),
        children: _getDialogChildren(elements, context),
      );

  List<Widget> _getDialogChildren(List<T> elements, BuildContext context) =>
      List<Widget>.generate(
        elements.length,
        (int index) => Column(
          children: <Widget>[
            if (index == 0) _getDivider(context),
            _getSimpleDialogOption(index, elements, context),
            _getDivider(context),
          ],
        ),
      );

  Widget _getSimpleDialogOption(
          int index, List<T> elements, BuildContext context) =>
      SizedBox(
        width: DynamicSize(context).width * 22,
        child: SimpleDialogOption(
          padding: EdgeInsets.symmetric(
              vertical: DynamicSize(context).responsiveSize * 2),
          onPressed: () => Navigator.of(context).pop(index),
          child: BaseText(
            elements[index].toString(),
            style: TextStyles(context)
                .subBodyStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      );

  Widget _getDivider(BuildContext context) => Divider(
        color: Theme.of(context).primaryColor,
        thickness: DynamicSize(context).responsiveSize * .1,
      );
}
