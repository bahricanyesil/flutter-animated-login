import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../decorations/text_styles.dart';
import '../providers/providers_shelf.dart';
import '../responsiveness/dynamic_size.dart';
import '../widgets/buttons/rounded_button.dart';
import '../widgets/texts/base_text.dart';
import '../widgets/texts/not_fitted_text.dart';

class WelcomePart extends StatefulWidget {
  const WelcomePart({
    required this.backgroundColor,
    required this.animationController,
    required this.loginTheme,
    required this.loginTexts,
    required this.animate,
    required this.animationCurve,
    required this.formWidthRatio,
    required this.showChangeActionTitle,
    this.changeActionButtonStyle,
    this.welcomeHorizontalPadding,
    Key? key,
  }) : super(key: key);
  final Color backgroundColor;
  final AnimationController animationController;
  final LoginTheme loginTheme;
  final LoginTexts loginTexts;
  final Function(BuildContext context) animate;
  final Curve animationCurve;
  final double formWidthRatio;
  final bool showChangeActionTitle;
  final ButtonStyle? changeActionButtonStyle;
  final EdgeInsets? welcomeHorizontalPadding;

  @override
  _WelcomePartState createState() => _WelcomePartState();
}

class _WelcomePartState extends State<WelcomePart> {
  late DynamicSize dynamicSize;
  late Auth auth;
  late ThemeData theme;
  late final Animation<double> transitionAnimation;

  @override
  void initState() {
    super.initState();
    transitionAnimation =
        Tween<double>(begin: 0, end: widget.formWidthRatio).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: widget.animationCurve,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamicSize = DynamicSize(context);
    theme = Theme.of(context);
    auth = context.watch<Auth>();
    return Transform.translate(
      offset: Offset(dynamicSize.width * transitionAnimation.value, 0),
      child: Container(
        color: widget.backgroundColor,
        width: dynamicSize.width * (100 - widget.formWidthRatio),
        height: dynamicSize.height * 100,
        child: _welcomeTexts,
      ),
    );
  }

  Widget get _welcomeTexts => Padding(
        padding: widget.welcomeHorizontalPadding ??
            dynamicSize.medHighHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title,
            SizedBox(height: dynamicSize.height * 6),
            _description,
            SizedBox(height: dynamicSize.height * 7),
            if (widget.showChangeActionTitle) _changeActionTitle,
            _changeActionButton,
          ],
        ),
      );

  Widget get _title => BaseText(
        isForward ? widget.loginTexts.welcomeBack : widget.loginTexts.welcome,
        style: TextStyles(context)
            .titleStyle(color: Colors.white)
            .merge(widget.loginTheme.welcomeTitleStyle),
      );

  Widget get _description => NotFittedText(
        isForward
            ? widget.loginTexts.welcomeBackDescription
            : widget.loginTexts.welcomeDescription,
        style: TextStyles(context)
            .bodyStyle()
            .merge(widget.loginTheme.welcomeDescriptionStyle),
      );

  Widget get _changeActionTitle => Padding(
        padding: dynamicSize.lowMedBottomPadding,
        child: BaseText(
          isForward
              ? widget.loginTexts.notHaveAnAccount
              : widget.loginTexts.alreadyHaveAnAccount,
          style: TextStyles(context)
              .subtitleTextStyle()
              .merge(widget.loginTheme.changeActionStyle),
        ),
      );

  Widget get _changeActionButton => RoundedButton(
        buttonText:
            isForward ? widget.loginTexts.signUp : widget.loginTexts.login,
        onPressed: () => widget.animate(context),
        borderColor: Colors.white,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        buttonStyle: widget.changeActionButtonStyle,
        textStyle: widget.loginTheme.changeActionTextStyle,
      );

  bool get isForward => transitionAnimation.value <= widget.formWidthRatio / 2;
}
