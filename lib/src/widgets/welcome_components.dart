import 'package:flutter/material.dart';

import '../decorations/text_styles.dart';
import '../providers/providers_shelf.dart';
import '../responsiveness/dynamic_size.dart';
import '../widgets/buttons/rounded_button.dart';
import '../widgets/texts/base_text.dart';
import '../widgets/texts/not_fitted_text.dart';

class LogoAndTexts extends StatelessWidget {
  const LogoAndTexts({
    required this.logo,
    required this.logoSize,
    required this.isForward,
    required this.loginTexts,
    required this.loginTheme,
    Key? key,
  }) : super(key: key);
  final String? logo;
  final Size? logoSize;
  final bool isForward;
  final LoginTexts loginTexts;
  final LoginTheme loginTheme;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          if (logo != null) _logo(context),
          _title(context),
          SizedBox(height: DynamicSize(context).height * (false ? 6 : 2)),
          _description(context),
        ],
      );

  Widget _title(BuildContext context) => BaseText(
        isForward ? loginTexts.welcomeBack : loginTexts.welcome,
        style: TextStyles(context)
            .titleStyle(color: Colors.white)
            .merge(loginTheme.welcomeTitleStyle),
      );

  Widget _description(BuildContext context) => NotFittedText(
        isForward
            ? loginTexts.welcomeBackDescription
            : loginTexts.welcomeDescription,
        style: TextStyles(context)
            .bodyStyle()
            .merge(loginTheme.welcomeDescriptionStyle),
      );

  Widget _logo(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return Container(
      constraints: BoxConstraints.tight(logoSize ??
          Size.fromHeight(dynamicSize.responsiveSize * (false ? 26 : 35))),
      padding: EdgeInsets.only(bottom: dynamicSize.height * (false ? 4 : 3)),
      child: Image.asset(logo!),
    );
  }
}

class ChangeActionButton extends StatelessWidget {
  const ChangeActionButton({
    required this.showChangeActionTitle,
    required this.isForward,
    required this.loginTexts,
    required this.loginTheme,
    required this.animate,
    required this.changeActionButtonStyle,
    Key? key,
  }) : super(key: key);
  final bool showChangeActionTitle;
  final bool isForward;
  final LoginTexts loginTexts;
  final LoginTheme loginTheme;
  final Function() animate;
  final ButtonStyle? changeActionButtonStyle;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          SizedBox(height: DynamicSize(context).height * 7),
          if (showChangeActionTitle) _changeActionTitle(context),
          _changeActionButton(context),
        ],
      );

  Widget _changeActionTitle(BuildContext context) => Padding(
        padding: DynamicSize(context).lowMedBottomPadding,
        child: BaseText(
          isForward
              ? loginTexts.notHaveAnAccount
              : loginTexts.alreadyHaveAnAccount,
          style: TextStyles(context)
              .subtitleTextStyle()
              .merge(loginTheme.changeActionStyle),
        ),
      );

  Widget _changeActionButton(BuildContext context) => RoundedButton(
        buttonText: isForward ? loginTexts.signUp : loginTexts.login,
        onPressed: animate,
        borderColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(.8),
        buttonStyle: changeActionButtonStyle,
        textStyle: loginTheme.changeActionTextStyle,
      );
}
