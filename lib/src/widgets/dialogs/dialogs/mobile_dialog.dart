import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../models/animated_dialog_theme.dart';
import '../../../responsiveness/dynamic_size.dart';
import 'base_dialog.dart';

class PlatformDialog with BaseDialog {
  /// Mobile specific alert dialog.
  const PlatformDialog({
    this.contentText,
    this.actionText,
    this.willPop = true,
    this.isDismissible = true,
    this.action,
    this.content,
    this.title,
    this.contentPaddingFactor,
  });

  final String? contentText;
  final bool willPop;
  final bool isDismissible;
  final Widget? content;
  final Widget? title;
  final AsyncCallback? action;
  final double? contentPaddingFactor;
  final String? actionText;

  Widget build(BuildContext context, AnimatedDialogTheme dialogTheme) =>
      Platform.isIOS
          ? _iosDialog(context, dialogTheme)
          : _androidDialog(context, dialogTheme);

  Widget _iosDialog(BuildContext context, AnimatedDialogTheme dialogTheme) =>
      CupertinoAlertDialog(
        title: title,
        content: _getContent(context, dialogTheme),
        actions: _getButtons(context, dialogTheme, isIOS: true),
      );

  Widget _androidDialog(
          BuildContext context, AnimatedDialogTheme dialogTheme) =>
      AlertDialog(
        shape: dialogTheme.shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: dialogTheme.elevation ?? 5,
        backgroundColor:
            dialogTheme.backgroundColor ?? Colors.white.withOpacity(.9),
        title: title,
        content: Padding(
          padding: dialogTheme.contentPadding ??
              EdgeInsets.all(DynamicSize(context).responsiveSize *
                  (contentPaddingFactor ?? 2)),
          child: _getContent(context, dialogTheme),
        ),
        actions: _getButtons(context, dialogTheme),
      );

  Widget _getContent(BuildContext context, AnimatedDialogTheme dialogTheme) =>
      getContent(context,
          contentText: contentText, content: content, dialogTheme: dialogTheme);

  List<Widget> _getButtons(
    BuildContext context,
    AnimatedDialogTheme dialogTheme, {
    bool isIOS = false,
  }) =>
      getButtons(
        context,
        action: action,
        actionText: actionText,
        willPop: willPop,
        isIOS: isIOS,
        dialogTheme: dialogTheme,
      );
}
