import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/button_styles.dart';
import '../../decorations/text_styles.dart';
import '../../providers/auth.dart';
import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

/// An [ElevatedButton] with rounded corners.
class RoundedButton extends StatefulWidget {
  /// Takes some parameters to customize the design,
  /// and uses "ButtonStyles(context).roundedStyle" to give roundness.
  const RoundedButton({
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth = 1.4,
    this.width,
    this.height,
    this.buttonStyle,
    Key? key,
  }) : super(key: key);

  /// Text on the button.
  final String buttonText;

  /// Callback to call on pressed.
  final AsyncCallback? onPressed;

  /// Background color of the button.
  final Color? backgroundColor;

  /// Border color of the button.
  final Color? borderColor;

  /// Radius of the borders.
  final BorderRadius? borderRadius;

  /// Width of the border.
  final double borderWidth;

  /// Width of the button.
  final double? width;

  /// Height of the button.
  final double? height;

  /// Style of the button.
  final ButtonStyle? buttonStyle;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _loading = false;
  late LoginTheme loginTheme;

  @override
  Widget build(BuildContext context) {
    loginTheme = context.read<LoginTheme>();
    return loginTheme.showLoadingButton
        ? AnimatedContainer(
            width: _buttonWidth,
            height: _buttonHeight,
            duration: const Duration(milliseconds: 300),
            child: _button)
        : _button;
  }

  Widget get _button => ElevatedButton(
        style: widget.buttonStyle != null
            ? widget.buttonStyle!
                .merge(_defaultButtonStyle(context, loginTheme.isLandscape))
            : _defaultButtonStyle(context, loginTheme.isLandscape),
        onPressed: widget.onPressed == null ? null : _onPressed,
        child: _buttonChild,
      );

  Widget get _buttonChild => _loading && loginTheme.showLoadingButton
      ? SizedBox(
          height: _loadingSize(context),
          width: _loadingSize(context),
          child:
              CircularProgressIndicator(color: loginTheme.loadingButtonColor),
        )
      : BaseText(widget.buttonText, forceDefaultStyle: true);

  double _loadingSize(BuildContext context) =>
      loginTheme.loadingButtonSize ?? DynamicSize(context).responsiveSize * 10;

  Future<void> _onPressed() async {
    if (_loading || widget.onPressed == null) return;
    setState(() => _loading = true);
    final Auth auth = context.read<Auth>();
    await auth.cancelableOperation?.cancel();
    auth.cancelableOperation = CancelableOperation<void>.fromFuture(
      widget.onPressed!(),
      onCancel: _setLoading,
    );
    auth.cancelableOperation?.then((_) => _setLoading());
  }

  void _setLoading() {
    if (mounted) setState(() => _loading = false);
  }

  /// Calls the rounded style from [ButtonStyles] class with custom parameters.
  ButtonStyle _defaultButtonStyle(BuildContext context, bool isLandscape) =>
      ButtonStyles(context).roundedStyle(
        borderWidth: widget.borderWidth,
        backgroundColor: widget.backgroundColor,
        borderColor: widget.borderColor ?? (isLandscape ? null : Colors.white),
        borderRadius: widget.borderRadius,
        size: Size(_buttonWidth, _buttonHeight),
        textStyle: TextStyles(context).bodyStyle(
          color: isLandscape ? Colors.white : Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
        ),
        foregroundColor:
            isLandscape ? Colors.white : Theme.of(context).primaryColor,
      );

  double get _buttonWidth => _loading && loginTheme.showLoadingButton
      ? _loadingSize(context) * 3.3
      : widget.width ??
          DynamicSize(context).width * (loginTheme.isLandscape ? 14 : 38);

  double get _buttonHeight =>
      widget.height ??
      DynamicSize(context).height * (loginTheme.isLandscape ? 9 : 7.3);
}
