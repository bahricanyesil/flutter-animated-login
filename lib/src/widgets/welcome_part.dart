import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../decorations/text_styles.dart';
import '../providers/providers_shelf.dart';
import '../responsiveness/dynamic_size.dart';
import '../widgets/buttons/rounded_button.dart';
import '../widgets/texts/base_text.dart';
import '../widgets/texts/not_fitted_text.dart';

/// Welcome part of the login screen.
/// It contains welcome title, description and change action button.
/// The button enables the user to switch between login and signup modes.
class WelcomePart extends StatefulWidget {
  const WelcomePart({
    required this.backgroundColor,
    required this.animationController,
    required this.loginTheme,
    required this.loginTexts,
    required this.animationCurve,
    required this.formWidthRatio,
    required this.showChangeActionTitle,
    this.changeActionButtonStyle,
    this.welcomeHorizontalPadding,
    this.logo,
    this.logoSize,
    this.backgroundImage,
    Key? key,
  }) : super(key: key);

  /// Background color of the whole welcome part.
  final Color backgroundColor;

  /// Main animation controller for the transition animation.
  final AnimationController animationController;

  /// Custom LoginTheme data, colors and styles on the screen.
  final LoginTheme loginTheme;

  /// Custom LoginTexts data, texts on the screen.
  final LoginTexts loginTexts;

  /// Custom animation curve that will be used for animations.
  final Curve animationCurve;

  /// Ratio of width of the form to the width of the screen.
  final double formWidthRatio;

  /// Determines whether the change action title should be displayed.
  /// (Not have an account? / Already have an account)
  final bool showChangeActionTitle;

  /// The button style of change action button that switches the mode.
  final ButtonStyle? changeActionButtonStyle;

  /// Horizontal padding of the welcome part widget.
  final EdgeInsets? welcomeHorizontalPadding;

  /// Full path of the logo that will be displayed above the welcome title.
  final String? logo;

  /// Size of the logo.
  final Size? logoSize;

  /// Background image path of the whole welcome part.
  final String? backgroundImage;

  @override
  _WelcomePartState createState() => _WelcomePartState();
}

class _WelcomePartState extends State<WelcomePart> {
  /// It is for giving responsive size values.
  late DynamicSize dynamicSize;

  /// Its aim is to take, manage, change auth data with the state.
  late Auth auth;

  /// Theme is created as a variable to call it from different code pieces.
  late ThemeData theme;

  /// Transition animation that will change the location of the welcome part.
  late final Animation<double> transitionAnimation;

  @override
  void initState() {
    super.initState();

    /// Initializes the transition animation from 0 to form part's width ratio
    /// with custom animation curve and animation controller.
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
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          image: widget.backgroundImage == null
              ? null
              : DecorationImage(
                  image: AssetImage(widget.backgroundImage!),
                  fit: BoxFit.cover,
                ),
        ),
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
            if (widget.logo != null) _logo,
            _title,
            SizedBox(height: dynamicSize.height * 6),
            _description,
            SizedBox(height: dynamicSize.height * 7),
            if (widget.showChangeActionTitle) _changeActionTitle,
            _changeActionButton,
          ],
        ),
      );

  Widget get _logo => Container(
        constraints: BoxConstraints.tight(
          widget.logoSize ?? Size.fromHeight(dynamicSize.height * 13),
        ),
        padding: EdgeInsets.only(bottom: dynamicSize.height * 3.3),
        child: Image.asset(widget.logo!),
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
        onPressed: animate,
        borderColor: Colors.white,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        buttonStyle: widget.changeActionButtonStyle,
        textStyle: widget.loginTheme.changeActionTextStyle,
      );

  void animate() {
    widget.animationController.isCompleted
        ? widget.animationController.reverse()
        : widget.animationController.forward();
    Provider.of<Auth>(context, listen: false).switchAuth();
  }

  bool get isForward => transitionAnimation.value <= widget.formWidthRatio / 2;
}
