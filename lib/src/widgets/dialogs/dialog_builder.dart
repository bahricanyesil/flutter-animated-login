import 'package:flutter/material.dart';
import '../../models/language_option.dart';
import 'custom_dialog.dart';
import 'single_choose_dialog.dart';

class DialogBuilder {
  const DialogBuilder(this.context);
  final BuildContext context;

  /// Shows error dialog
  void showErrorDialog(String text) =>
      AnimatedDialog(contentText: text).show(context);

  Future<int?> showSelectDialog(String title, List<LanguageOption> elements,
          LanguageOption? initialValue) async =>
      showDialog<int>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => SingleChooseDialog(
            title: title, elements: elements, initialValue: initialValue),
      );
}
