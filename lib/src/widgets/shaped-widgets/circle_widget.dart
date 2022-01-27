import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';
import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';

/// Provides a circle button with custom stylings.
class CircleWidget extends StatefulWidget {
  /// Shapes the button as circle with the given height/width.
  const CircleWidget({
    required this.child,
    this.widthFactor = 13,
    this.borderWidthFactor,
    this.onTap,
    this.color,
    this.hoverColor,
    this.border,
    Key? key,
  }) : super(key: key);

  /// Child of the circle wrapper.
  final Widget child;

  /// Width factor.
  final double widthFactor;

  /// AsyncCallback to call on tap.
  final AsyncCallback? onTap;

  /// Width factor for the borders.
  final double? borderWidthFactor;

  /// Color of the widget.
  final Color? color;

  /// Hover color.
  final Color? hoverColor;

  /// Cutom border style.
  final BorderSide? border;

  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  bool _loading = false;
  late DynamicSize dynamicSize;
  late LoginTheme loginTheme;

  @override
  Widget build(BuildContext context) {
    dynamicSize = DynamicSize(context);
    loginTheme = context.read<LoginTheme>();
    return SizedBox(
      width: dynamicSize.responsiveSize * widget.widthFactor,
      height: dynamicSize.responsiveSize * widget.widthFactor,
      child: RawMaterialButton(
        onPressed: _onPressed,
        hoverColor: widget.hoverColor ??
            (widget.color?.withOpacity(.7) ??
                Theme.of(context).primaryColorLight.withOpacity(.7)),
        highlightColor: loginTheme.socialHighlightColor ??
            (widget.color?.withOpacity(.7) ??
                Theme.of(context).primaryColorLight.withOpacity(.7)),
        shape: _buttonShape(context),
        padding:
            EdgeInsets.all(dynamicSize.responsiveSize * widget.widthFactor / 4),
        elevation: 3,
        child: _buttonChild,
      ),
    );
  }

  Widget get _buttonChild => _loading && loginTheme.showLoadingSocialButton
      ? CircularProgressIndicator(
          color: loginTheme.loadingSocialButtonColor ??
              Colors.white.withOpacity(.9),
        )
      : widget.child;

  Future<void> _onPressed() async {
    if (_loading || widget.onTap == null) return;
    setState(() => _loading = true);
    final Auth auth = context.read<Auth>();
    await auth.cancelableOperation?.cancel();
    auth.cancelableOperation = CancelableOperation<void>.fromFuture(
      widget.onTap!(),
      onCancel: _setLoading,
    );
    auth.cancelableOperation?.then((_) => _setLoading());
  }

  void _setLoading() {
    if (mounted) setState(() => _loading = false);
  }

  /// Returns the border style of the button.
  ShapeBorder _buttonShape(BuildContext context) => CircleBorder(
        side: widget.border ??
            BorderSide(
              color: widget.color ?? Colors.black54,
              width: dynamicSize.width * (widget.borderWidthFactor ?? .2),
            ),
      );
}
