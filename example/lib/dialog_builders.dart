import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class DialogBuilder {
  /// Builds various dialogs with different methods.
  /// * e.g. [showLoadingDialog], [showResultDialog]
  const DialogBuilder(this.context);

  /// Takes [context] as parameter.
  final BuildContext context;

  /// Example loading dialog
  Future<void> showLoadingDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: const AlertDialog(
            content: LoadingIndicator(),
          ),
        ),
      );

  /// Example result dialog
  Future<void> showResultDialog(String text) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: 100,
            width: 100,
            child: Center(child: Text(text, textAlign: TextAlign.center)),
          ),
        ),
      );
}
