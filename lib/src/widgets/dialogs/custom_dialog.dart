import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/text_styles.dart';
import '../../models/animated_dialog_theme.dart';
import '../../providers/login_texts.dart';
import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

class AnimatedDialog {
  AnimatedDialog({
    this.contentText,
    this.actionText,
    this.willPop = true,
    this.isDismissible = true,
    this.action,
    this.content,
    this.title,
    this.contentPaddingFactor = 3,
  });

  final String? contentText;
  final bool willPop;
  final bool isDismissible;
  final Widget? content;
  final Widget? title;
  final Function()? action;
  final double contentPaddingFactor;
  String? actionText;

  late final AnimatedDialogTheme dialogTheme;

  Future<T?> show<T>(BuildContext context) async {
    dialogTheme =
        context.read<LoginTheme>().dialogTheme ?? const AnimatedDialogTheme();
    actionText = context.read<LoginTexts>().dialogButtonText;
    return showModal<T>(
      configuration: FadeScaleTransitionConfiguration(
        transitionDuration:
            dialogTheme.animationDuration ?? const Duration(milliseconds: 400),
      ),
      context: context,
      builder: (BuildContext localContext) => WillPopScope(
        onWillPop: () async => isDismissible,
        child: _dialogChild(localContext),
      ),
    );
  }

  Widget _dialogChild(BuildContext context) {
    if (kIsWeb) {
      return _androidWebDialog(context);
    } else if (Platform.isIOS) {
      return iosDialog(context);
    } else {
      return _androidWebDialog(context);
    }
  }

  Widget iosDialog(BuildContext context) => CupertinoAlertDialog(
        title: title,
        content: _content(context),
        actions: _setDialogButton(context),
      );

  Widget _androidWebDialog(BuildContext context) => AlertDialog(
        shape: dialogTheme.shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: dialogTheme.elevation ?? 5,
        backgroundColor:
            dialogTheme.backgroundColor ?? Colors.white.withOpacity(.9),
        title: title,
        content: Padding(
          padding: dialogTheme.contentPadding ??
              EdgeInsets.all(
                  DynamicSize(context).responsiveSize * contentPaddingFactor),
          child: _content(context),
        ),
        actions: _setDialogButton(context),
      );

  Widget _content(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return content ??
        ConstrainedBox(
          constraints: dialogTheme.contentBoxConstraints ??
              BoxConstraints.loose(
                Size(dynamicSize.width * 50, dynamicSize.height * 60),
              ),
          child: Text(
            contentText ?? 'No Content Text',
            style: TextStyles(context)
                .dialogTextStyle()
                .merge(dialogTheme.contentTextStyle),
            textAlign: dialogTheme.contentTextAlign ?? TextAlign.center,
          ),
        );
  }

  List<Widget> _setDialogButton(BuildContext context) {
    if (kIsWeb) {
      return _getButtons(context);
    } else if (Platform.isIOS) {
      return _getButtons(context, isIOS: true);
    } else {
      return _getButtons(context);
    }
  }

  List<Widget> _getButtons(BuildContext context, {bool isIOS = false}) =>
      <Widget>[
        if (actionText != null) _getRightButton(context, isIOS: isIOS),
      ];

  Widget _getRightButton(BuildContext context, {required bool isIOS}) =>
      Padding(
        padding: dialogTheme.actionsPadding ?? getButtonPadding(context),
        child: isIOS
            ? CupertinoDialogAction(
                onPressed: () async => _rightButtonAction(context),
                child: _buttonText(actionText!, context),
              )
            : InkWell(
                onTap: () async => _rightButtonAction(context),
                child: _buttonText(actionText!, context),
              ),
      );

  Future<void> _rightButtonAction(BuildContext context) async {
    if (willPop) Navigator.of(context).pop();
    if (action != null) await action!();
  }

  Widget _buttonText(String text, BuildContext context) => BaseText(actionText!,
      style: TextStyles(context)
          .subtitleTextStyle(color: Theme.of(context).primaryColor)
          .merge(dialogTheme.actionTextStyle));

  EdgeInsets getButtonPadding(BuildContext context) => EdgeInsets.only(
        right: DynamicSize(context).width * 1.2,
        bottom: DynamicSize(context).height * 1,
      );
}
