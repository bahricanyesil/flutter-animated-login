import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/text_styles.dart';
import '../../models/language_option.dart';
import '../../providers/login_theme.dart';
import '../texts/base_text.dart';
import 'custom_dialog.dart';
import 'single_choose_dialog.dart';

class DialogBuilder {
  /// Dialog builder for displaying dialogs.
  const DialogBuilder(this.context);
  final BuildContext context;

  /// Shows error dialog.
  void showErrorDialog(String text) =>
      AnimatedDialog(contentText: text).show(context);

  /// Shows multiple selection dialog.
  Future<int?> showSelectDialog(String titleText, List<LanguageOption> elements,
          LanguageOption? initialValue) async =>
      AnimatedDialog(
        content: SingleChooseDialog(
          elements: elements,
          initialValue: initialValue,
          theme: context.read<LoginTheme>().dialogTheme?.languageDialogTheme,
        ),
        contentPaddingFactor: 2.5,
        title: _getSelectTitle(titleText),
      ).show(context);

  Widget _getSelectTitle(String titleText) => BaseText(
        titleText,
        style: TextStyles(context).subtitleTextStyle(
            color: Theme.of(context).primaryColor.withOpacity(.7)),
      );
}
