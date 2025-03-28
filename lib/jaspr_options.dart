// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:cross_website/components/common/button_primary_black.dart' as prefix0;
import 'package:cross_website/components/home_page/header_home_page.dart' as prefix1;
import 'package:cross_website/components/home_page/list_logo.dart' as prefix2;
import 'package:cross_website/components/header.dart' as prefix3;
import 'package:cross_website/language/language_manager.dart' as prefix4;
import 'package:cross_website/pages/about.dart' as prefix5;
import 'package:cross_website/pages/home.dart' as prefix6;
import 'package:cross_website/app.dart' as prefix7;

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
    prefix7.App: ClientTarget<prefix7.App>('app'),
    prefix5.About: ClientTarget<prefix5.About>('pages/about'),
    prefix6.Home: ClientTarget<prefix6.Home>('pages/home'),
  },
  styles: () => [
    ...prefix0.ButtonPrimaryBlack.styles,
    ...prefix1.HeaderHomePage.styles,
    ...prefix2.ListLogo.styles,
    ...prefix3.Header.styles,
    ...prefix4.LanguageManager.styles,
    ...prefix5.About.styles,
    ...prefix7.App.styles,
  ],
);
