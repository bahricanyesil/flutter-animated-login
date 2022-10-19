# Versions

## [1.5.5] - 18.10.2022

* Implemented custom validator callback for customized error messages by utilizing the validator logic.

## [1.5.4] - 21.06.2022

* Fixed inoperative initial mode parameter.

## [1.5.3] - 17.06.2022

* Exported AnimationType enum for full customization.

## [1.5.2] - 17.06.2022

* Upgraded the Flutter version to 3.0.2.
* Upgraded all dependent packages.
* Fixed problems to pass the static analysis.

## [1.5.1] - 18.02.2022

* Fixed wrong ss gif.

## [1.5.0] - 18.02.2022

* Fixed small bugs
* Resolved focus and text form value issues
* Default padding value adjustments
* Renewed walk through videos

## [1.4.1] - 13.02.2022

* Fixed deprecated warnings

## [1.4.0] - 12.02.2022

* Extracted main components as widgets
* Enabled custom ordering of the screen elements
* Wrapped most elements with padding to enable custom margins around the components
* Collected auth operations in auth provider and minimized business on view files
* Optimizations on example app
* Screen size adjustments

## [1.3.0] - 28.01.2022

* Loading indicators are integrated to the buttons instead of dialogs.
* Integrated cancelable operations for auth functions.
* CopyWith method is added to the AnimatedDialogTheme and LanguageDialogTheme.
* Small optimizations and bug fixes.

## [1.2.1] - 27.01.2022

* Fixed the auth mode change behavior on mobile.
* Optimized the spaces/paddings between form and action button for mobile.

## [1.2.0] - 27.01.2022

* Optimized the use of AnimatedBuilder to avoid unnecessary rebuilds.
* Optimized the management of the state.
* Added additional style parameters to allow users to further customize.
* Performed optimization tests.

## [1.1.0] - 26.01.2022

* Completed all of the documentation.
* Fixed material dependency of the simple dialog option widget (InkWell).
* Changed the logic behind the theming and responsiveness.
* Layout builder and isLandscape variable used just for web.
* Focus changes on the input fields.

## [1.0.0] - 25.11.2021

* Removed universal io package dependency and used conditional import for animated dialogs.
* Implemented platform specific dialogs.
* Logo asset path string is converted to complete logo widget to provide more customizations.
* Optimizations in the readme file.
* The package is tested by multiple users and projects. So, version 1.0.0 can be published now, yay!

## [0.0.5] - 15.11.2021

* Replaced "io" package with [universal_io](https://pub.dev/packages/universal_io/example) because of web support.

## [0.0.4] - 15.11.2021

Fixed most of the issues opened by [@wer-mathurin](https://github.com/wer-mathurin), special thanks to [@wer-mathurin](https://github.com/wer-mathurin)
Fixes, New Features:

* Implemented AnimatedDialog with a soft animation for general dialog use
* Implemented LanguageDialogTheme model for language dialog style
* Implemented AnimatedDialogTheme model for custom dialog style
* Added "copyWith" method to LoginViewTheme
* Added auto-fill hints for email, password, and name fields
* Added distinct text input types for each input field.
* Created two distinct LoginViewTheme parameters for desktop and mobile views.
* Added initialAuthMode field to be able to start with a custom mode (login/signup)
* Added onAuthModeChange field to be able to track the current mode and may take some actions.
* Removed actionTextStyle and changeActionTextStyle since they are suppressed by the foreground color of button styles.
* Changed initialLanguage to selectedLanguage
* Changed example project to show language change in a stateful widget.
* ValidatorModel is created for custom validations
* With the help of this new model, you can directly use your own custom validation or you can also enable/disable some of the default validations.
* Form and welcome components are declared as private and part of the animated login widget.
* Name parameters in the callbacks
* The return type is changed to LanguageOption instead of String in the ChangeLanguageCallback
* Field names are revised in the LanguageOption model.
* Used equality operator instead of direct field comparison in the language comparison.
* Readme and documentation update
* Transferred style parameters to LoginTheme:
1- animationCurve
2- formWidthRatio
3- animationDuration
4- formElementsSpacing
5- socialLoginsSpacing
6- actionButtonStyle
7- changeActionButtonStyle
8- welcomePadding
9- formPadding
10- logoSize
* Removed unnecessary change language button style properties such as: border color, background-color

## [0.0.3] - 07.11.2021

* Added change language button with dialog, adjustments on sizes.

## [0.0.2] - 31.10.2021

* Updated readme file, added contributing and issue template documents.

## [0.0.1] - 30.10.2021

* Initial release of the animated login screen.
