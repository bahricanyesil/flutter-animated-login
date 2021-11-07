import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/language_option.dart';
import '../../providers/login_texts.dart';
import '../../responsiveness/dynamic_size.dart';
import '../widgets_shelf.dart';
import 'single_choose_dialog.dart';

class DialogBuilder {
  const DialogBuilder(this.localContext);
  final BuildContext localContext;

  /// Shows error dialog
  void showErrorDialog(String text) => showDialog(
        context: localContext,
        builder: (BuildContext context) {
          final DynamicSize dynamicSize = DynamicSize(context);
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(
              horizontal: dynamicSize.width * 1.5,
              vertical: dynamicSize.height * 2.8,
            ),
            actionsPadding: EdgeInsets.only(
              bottom: dynamicSize.height * .8,
              right: dynamicSize.width * .8,
            ),
            content: _content(text, context),
            actions: <Widget>[_okButton(context)],
          );
        },
      );

  Future<int?> showSelectDialog(String title, List<LanguageOption> elements,
          LanguageOption? initialValue) async =>
      showDialog<int>(
        context: localContext,
        barrierDismissible: true,
        builder: (BuildContext context) => SingleChooseDialog(
            title: title, elements: elements, initialValue: initialValue),
      );

  Widget _content(String text, BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        Size(dynamicSize.width * 50, dynamicSize.height * 60),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: DynamicSize(context).responsiveSize * 4.2),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _okButton(BuildContext context) => InkWell(
        child: Padding(
          padding: EdgeInsets.all(DynamicSize(context).responsiveSize * 1.6),
          child: BaseText(
            localContext.read<LoginTexts>().dialogButtonText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: DynamicSize(context).responsiveSize * 3.5,
            ),
          ),
        ),
        onTap: () => Navigator.of(context).pop(),
      );
}
