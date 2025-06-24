// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:cross_website/components/common/button_primary_black.dart'
    as prefix0;
import 'package:cross_website/components/common/custom_grid.dart' as prefix1;
import 'package:cross_website/components/common/menu_button.dart' as prefix2;
import 'package:cross_website/components/common/title_icon_home.dart'
    as prefix3;
import 'package:cross_website/components/home_page/card_process_block.dart'
    as prefix4;
import 'package:cross_website/components/home_page/case_studies_block.dart'
    as prefix5;
import 'package:cross_website/components/home_page/contact_us_block.dart'
    as prefix6;
import 'package:cross_website/components/home_page/cta_block.dart' as prefix7;
import 'package:cross_website/components/home_page/footer_block.dart'
    as prefix8;
import 'package:cross_website/components/home_page/header_home_page.dart'
    as prefix9;
import 'package:cross_website/components/home_page/item_services.dart'
    as prefix10;
import 'package:cross_website/components/home_page/list_logo.dart' as prefix11;
import 'package:cross_website/components/header.dart' as prefix12;
import 'package:cross_website/constants/app_colors.dart' as prefix13;
import 'package:cross_website/constants/theme_toogle.dart' as prefix14;
import 'package:cross_website/pages/about.dart' as prefix15;
import 'package:cross_website/pages/home.dart' as prefix16;
import 'package:cross_website/pages/not_found_page.dart' as prefix17;
import 'package:cross_website/app.dart' as prefix18;

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
JasprOptions get defaultJasprOptions => JasprOptions(
  clients: {
    prefix18.App: ClientTarget<prefix18.App>('app'),

    prefix6.ContactUsBlock: ClientTarget<prefix6.ContactUsBlock>(
      'components/home_page/contact_us_block',
    ),

    prefix15.About: ClientTarget<prefix15.About>('pages/about'),

    prefix16.Home: ClientTarget<prefix16.Home>('pages/home'),
  },
  styles: () => [
    ...prefix0.ButtonPrimaryBlack.styles,
    ...prefix1.CustomGrid.styles,
    ...prefix2.MenuButton.styles,
    ...prefix3.TitleIconHome.styles,
    ...prefix4.CardProcessBlockState.style,
    ...prefix5.CaseStudiesBlock.style,
    ...prefix6.ContactUsBlockState.style,
    ...prefix7.CtaBlock.style,
    ...prefix8.FooterBlock.style,
    ...prefix9.HeaderHomePage.styles,
    ...prefix10.ItemServices.styles,
    ...prefix11.ListLogo.styles,
    ...prefix12.HeaderState.styles,
    ...prefix13.root,
    ...prefix14.ThemeToggleState.styles,
    ...prefix15.About.styles,
    ...prefix17.NotFoundPage.styles,

    ...prefix18.AppState.styles,
  ],
);
