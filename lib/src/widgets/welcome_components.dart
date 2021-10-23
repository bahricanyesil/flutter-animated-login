import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../decorations/text_styles.dart';
import '../providers/providers_shelf.dart';
import '../responsiveness/dynamic_size.dart';
import '../utils/view_type_helper.dart';
import '../widgets/buttons/rounded_button.dart';
import '../widgets/texts/base_text.dart';
import '../widgets/texts/not_fitted_text.dart';

class LogoAndTexts extends StatelessWidget {
  const LogoAndTexts({
    required this.logo,
    required this.logoSize,
    required this.isReverse,
    Key? key,
  }) : super(key: key);
  final String? logo;
  final Size? logoSize;
  final bool isReverse;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          if (logo != null) _logo(context),
          _title(context),
          SizedBox(
              height: DynamicSize(context).height *
                  (ViewTypeHelper(context).isLandscape ? 6 : 1.8)),
          _description(context),
        ],
      );

  Widget _title(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return BaseText(
      isReverse ? loginTexts.welcomeBack : loginTexts.welcome,
      style: TextStyles(context)
          .titleStyle(color: Colors.white)
          .merge(context.read<LoginTheme>().welcomeTitleStyle),
    );
  }

  Widget _description(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return NotFittedText(
      isReverse
          ? loginTexts.welcomeBackDescription
          : loginTexts.welcomeDescription,
      style: TextStyles(context)
          .bodyStyle()
          .merge(context.read<LoginTheme>().welcomeDescriptionStyle),
    );
  }

  Widget _logo(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    final bool isLandscape = context.read<LoginTheme>().isLandscape;
    return Container(
      constraints: BoxConstraints.tight(logoSize ??
          Size.fromHeight(
              dynamicSize.responsiveSize * (isLandscape ? 26 : 30))),
      padding:
          EdgeInsets.only(bottom: dynamicSize.height * (isLandscape ? 4 : 2)),
      child: Image.asset(logo!),
    );
  }
}

class ChangeActionButton extends StatelessWidget {
  const ChangeActionButton({
    required this.isReverse,
    required this.animate,
    required this.changeActionButtonStyle,
    Key? key,
  }) : super(key: key);
  final bool isReverse;
  final Function() animate;
  final ButtonStyle? changeActionButtonStyle;

  @override
  Widget build(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return RoundedButton(
      buttonText: isReverse ? loginTexts.signUp : loginTexts.login,
      onPressed: animate,
      borderColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(.8),
      buttonStyle: changeActionButtonStyle,
      textStyle: context.read<LoginTheme>().changeActionTextStyle,
    );
  }
}

class ChangeActionTitle extends StatelessWidget {
  const ChangeActionTitle({
    required this.isReverse,
    this.showButtonText = false,
    this.animate,
    Key? key,
  }) : super(key: key);
  final bool isReverse;
  final bool showButtonText;
  final Function()? animate;

  @override
  Widget build(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return showButtonText
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _changeActionTitle(context, loginTexts),
              _changeActionGesture(context, animate)
            ],
          )
        : _changeActionTitle(context, loginTexts);
  }

  Widget _changeActionTitle(BuildContext context, LoginTexts loginTexts) =>
      BaseText(
        isReverse
            ? loginTexts.notHaveAnAccount
            : loginTexts.alreadyHaveAnAccount,
        style: TextStyles(context)
            .subtitleTextStyle()
            .merge(context.read<LoginTheme>().changeActionStyle),
      );

  Widget _changeActionGesture(BuildContext context, Function()? animate) =>
      Padding(
        padding: DynamicSize(context).lowLeftPadding,
        child: InkWell(
          onTap: animate,
          child: _changeActionText(context),
        ),
      );

  Widget _changeActionText(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return BaseText(
      isReverse ? loginTexts.signUp : loginTexts.login,
      style: TextStyles(context)
          .subtitleTextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          )
          .merge(context.read<LoginTheme>().changeActionStyle),
    );
  }
}
