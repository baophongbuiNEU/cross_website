// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:my_website/components/common/button_primary_black.dart' as prefix0;
import 'package:my_website/components/home_page/header_home_page.dart' as prefix1;
import 'package:my_website/components/home_page/list_logo.dart' as prefix2;
import 'package:my_website/components/header.dart' as prefix3;
import 'package:my_website/constants/app_colors.dart' as prefix4;
import 'package:my_website/constants/theme_toogle.dart' as prefix5;
import 'package:my_website/pages/about.dart' as prefix6;
import 'package:my_website/pages/home.dart' as prefix7;
import 'package:my_website/app.dart' as prefix8;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
final defaultJasprOptions = JasprOptions(
  clients: {
    prefix8.App: ClientTarget<prefix8.App>('app'),
    prefix6.About: ClientTarget<prefix6.About>('pages/about'),
    prefix7.Home: ClientTarget<prefix7.Home>('pages/home'),
  },
  styles: () => [
    ...prefix0.ButtonPrimaryBlack.styles,
    ...prefix1.HeaderHomePage.styles,
    ...prefix2.ListLogo.styles,
    ...prefix3.HeaderState.styles,
    ...prefix4.root,
    ...prefix5.ThemeToggleState.styles,
    ...prefix6.About.styles,
    ...prefix8.AppState.styles,
  ],
);
