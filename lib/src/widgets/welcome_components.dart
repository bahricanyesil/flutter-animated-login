part of '../../animated_login.dart';

class _LogoAndTexts extends StatelessWidget {
  const _LogoAndTexts({
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

class _ChangeActionButton extends StatelessWidget {
  const _ChangeActionButton({
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
    );
  }
}

class _ChangeActionTitle extends StatelessWidget {
  const _ChangeActionTitle({
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

class _ChangeLanguage extends StatelessWidget {
  final List<LanguageOption> languageOptions;
  final Function(LanguageOption? language) chooseLanguageCallback;
  final Animation<double> colorTween;
  final ChangeLangOnPressedCallback? onPressed;
  const _ChangeLanguage({
    required this.chooseLanguageCallback,
    required this.colorTween,
    this.languageOptions = const <LanguageOption>[],
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle? buttonStyle =
        context.read<LoginTheme>().changeLangButtonStyle;
    final LanguageOption selectedLanguage =
        context.watch<LoginTexts>().language!;
    return AnimatedBuilder(
      animation: colorTween,
      builder: (BuildContext context, _) => ElevatedButton(
        style: buttonStyle != null
            ? buttonStyle.merge(_defaultButtonStyle(context))
            : _defaultButtonStyle(context),
        onPressed: () async {
          if (onPressed != null) {
            final LanguageOption? newLanguage = onPressed!();
            if (newLanguage != null) {
              context.read<LoginTexts>().setLanguage(newLanguage);
            }
          } else {
            await _openChooseDialog(context, selectedLanguage);
          }
        },
        child: _buttonChild(context, selectedLanguage),
      ),
    );
  }

  Widget _buttonChild(BuildContext context, LanguageOption selectedLanguage) {
    final double responsiveSize = DynamicSize(context).responsiveSize;
    final LoginTheme loginTheme = context.read<LoginTheme>();
    return Row(
      children: <Widget>[
        SizedBox(width: responsiveSize * 1),
        Expanded(
          flex: 2,
          child: selectedLanguage.iconPath == null
              ? _defaultIcon(context)
              : Image.asset(selectedLanguage.iconPath!),
        ),
        SizedBox(width: responsiveSize * 1.3),
        Expanded(
          flex: 3,
          child: BaseText(
            selectedLanguage.code,
            style: TextStyle(
              fontSize: responsiveSize * 4.4,
              color: _contentColor(context),
            ).merge(loginTheme.changeLangButtonTextStyle),
          ),
        ),
        SizedBox(width: responsiveSize * 1),
      ],
    );
  }

  Widget _defaultIcon(BuildContext context) => BaseIcon(
        Icons.language_outlined,
        color: _contentColor(context),
        padding: EdgeInsets.zero,
      );

  Future<void> _openChooseDialog(
          BuildContext context, LanguageOption selectedLanguage) async =>
      DialogBuilder(context)
          .showSelectDialog(context.read<LoginTexts>().chooseLanguageTitle,
              languageOptions, selectedLanguage)
          .then((int? index) {
        LanguageOption? selectedLang;
        if (index != null) selectedLang = languageOptions[index];
        if (selectedLang != null) {
          context.read<LoginTexts>().setLanguage(selectedLang);
        }
        chooseLanguageCallback(selectedLang);
      });

  ButtonStyle _defaultButtonStyle(BuildContext context) {
    final double responsiveSize = DynamicSize(context).responsiveSize;
    return ButtonStyles(context).roundedStyle(
      borderWidth: 1.4,
      backgroundColor: _buttonBgColor(context),
      borderRadius: BorderRadius.circular(8),
      padding: EdgeInsets.symmetric(horizontal: responsiveSize * 2),
      size: Size(responsiveSize * 20, responsiveSize * 12),
      elevation: 16,
    );
  }

  Color? _contentColor(BuildContext context) =>
      context.read<LoginTheme>().changeLangContentColor ??
      Color.lerp(
          Colors.white, Theme.of(context).primaryColor, colorTween.value);

  Color? _buttonBgColor(BuildContext context) => Color.lerp(
      Theme.of(context).primaryColor, Colors.white, colorTween.value);
}
