import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show AsyncCallback;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/animated_dialog_theme.dart';
import '../../providers/login_theme.dart';
import 'dialogs/mobile_dialog.dart'
    if (dart.library.html) 'dialogs/web_dialog.dart';

/// Creates custom animated dialog specific to each platform.
class AnimatedDialog extends PlatformDialog {
  /// Creates custom animated dialog specific to each platform.
  const AnimatedDialog({
    String? contentText,
    String? actionText,
    bool willPop = true,
    bool isDismissible = true,
    AsyncCallback? action,
    Widget? content,
    Widget? title,
    double? contentPaddingFactor,
  }) : super(
          action: action,
          contentText: contentText,
          actionText: actionText,
          willPop: willPop,
          isDismissible: isDismissible,
          content: content,
          title: title,
          contentPaddingFactor: contentPaddingFactor,
        );

  /// Displays the dialog on the screen.
  Future<T?> show<T>(BuildContext context) async {
    final AnimatedDialogTheme dialogTheme =
        context.read<LoginTheme>().dialogTheme ?? const AnimatedDialogTheme();
    return showModal<T>(
      configuration: FadeScaleTransitionConfiguration(
        transitionDuration:
            dialogTheme.animationDuration ?? const Duration(milliseconds: 400),
      ),
      context: context,
      builder: (BuildContext localContext) => WillPopScope(
        onWillPop: () async => isDismissible,
        child: build(context, dialogTheme),
      ),
    );
  }
}
