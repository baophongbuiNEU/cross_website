// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:cross_website/components/common/button_primary_black.dart' as prefix0;
import 'package:cross_website/components/common/custom_grid.dart' as prefix1;
import 'package:cross_website/components/common/divider.dart' as prefix2;
import 'package:cross_website/components/common/menu_button.dart' as prefix3;
import 'package:cross_website/components/common/title_icon_home.dart' as prefix4;
import 'package:cross_website/components/home_page/card_process_block.dart' as prefix5;
import 'package:cross_website/components/home_page/case_studies_block.dart' as prefix6;
import 'package:cross_website/components/home_page/contact_us_block.dart' as prefix7;
import 'package:cross_website/components/home_page/cta_block.dart' as prefix8;
import 'package:cross_website/components/home_page/footer_block.dart' as prefix9;
import 'package:cross_website/components/home_page/header_home_page.dart' as prefix10;
import 'package:cross_website/components/home_page/item_services.dart' as prefix11;
import 'package:cross_website/components/home_page/list_logo.dart' as prefix12;
import 'package:cross_website/components/header.dart' as prefix13;
import 'package:cross_website/constants/app_colors.dart' as prefix14;
import 'package:cross_website/constants/theme_toogle.dart' as prefix15;
import 'package:cross_website/pages/about.dart' as prefix16;
import 'package:cross_website/pages/home.dart' as prefix17;
import 'package:cross_website/pages/not_found_page.dart' as prefix18;
import 'package:cross_website/pages/services.dart' as prefix19;
import 'package:cross_website/app.dart' as prefix20;

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
    prefix20.App: ClientTarget<prefix20.App>('app'),
    prefix16.About: ClientTarget<prefix16.About>('pages/about'),
    prefix17.Home: ClientTarget<prefix17.Home>('pages/home'),
    prefix19.Services: ClientTarget<prefix19.Services>('pages/services'),
  },
  styles: () => [
    ...prefix0.ButtonPrimaryBlack.styles,
    ...prefix1.CustomGrid.styles,
    ...prefix2.Divider.styles,
    ...prefix3.MenuButton.styles,
    ...prefix4.TitleIconHome.styles,
    ...prefix5.CardProcessBlockState.style,
    ...prefix6.CaseStudiesBlock.style,
    ...prefix7.ContactUsBlockState.style,
    ...prefix8.CtaBlock.style,
    ...prefix9.FooterBlock.style,
    ...prefix10.HeaderHomePage.styles,
    ...prefix11.ItemServices.styles,
    ...prefix12.ListLogo.styles,
    ...prefix13.HeaderState.styles,
    ...prefix14.root,
    ...prefix15.ThemeToggleState.styles,
    ...prefix16.About.styles,
    ...prefix16.GoalComponent.styles,
    ...prefix16.KeyValueComponent.styles,
    ...prefix18.NotFoundPage.styles,
    ...prefix20.AppState.styles,
  ],
);
