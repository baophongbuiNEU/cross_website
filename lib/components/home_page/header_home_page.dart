import 'package:cross_website/components/common/button_primary_black.dart';
import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:cross_website/components/header.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:universal_web/web.dart' as web;

class HeaderHomePage extends StatelessComponent {
  const HeaderHomePage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang =
        context.watch(LanguageManager.selectedLanguageProvider);

    yield div(classes: 'header-web', [
      div(classes: 'header-web-padding', [
        div(classes: 'text-header-web', [
          div(classes: 'w500-60-custom', [
            text(LanguageManager.translate(
                'header_home_page_title', selectedLang)),
          ]),
          SizeBoxComponent(height: 35),
          div(classes: 'w400-20-custom', [
            text(LanguageManager.translate(
                'header_home_page_subtitle', selectedLang)),
          ]),
          SizeBoxComponent(height: 35),
          ButtonPrimaryBlack(
            onClick: () {
              var el =
                  web.document.querySelector('#services') as web.HTMLElement;
              web.window.scrollTo(
                  web.ScrollToOptions(top: el.offsetTop, behavior: 'smooth'));
            },
            text: LanguageManager.translate(
                'header_home_page_button', selectedLang),
          ),
        ]),
        // img(
        //   id: 'primary_image',
        //   src: 'images/demo_primary_image.png',
        // ),
        iframe(classes: 'primary_image',
            src:
                "https://lottie.host/embed/3a7f8b85-040f-422b-a652-b0cb1561e655/AnFjBAGkJL.lottie", [])
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css.import(
            "https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&display=swap"),
        css('.header-web', [
          css('&').styles(
            display: Display.flex,
            maxWidth: 100.percent,
          ),
        ]),
        css('.header-web-padding', [
          css('&').styles(
            display: Display.flex,
            width: 100.percent,
            padding: Padding.only(
                left: 5.percent, right: 5.percent, bottom: 70.px, top: 20.px),
            flexDirection: FlexDirection.row,
            justifyContent: JustifyContent.spaceBetween,
            alignItems: AlignItems.center,
          ),
        ]),
        css('.text-header-web', [
          css('&').styles(
            display: Display.flex,
            width: 45.percent,
            flexDirection: FlexDirection.column,
          ),
        ]),
        css('.w500-60-custom', [
          css('&').styles(
            color: AppColors.textBlack,
            fontFamily: FontFamily.list(
                [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
            fontSize: 60.px,
            fontWeight: FontWeight.w500,
          ),
        ]),
        css('.w400-20-custom', [
          css('&').styles(
            color: AppColors.textBlack,
            fontFamily: FontFamily.list(
                [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
            fontSize: 20.px,
            fontWeight: FontWeight.w400,
          ),
        ]),
        css('.primary_image').styles(
          width: 50.percent,
          height: 700.px,
          border: Border(style: BorderStyle.none),
        ),
        css.media(
            MediaQuery.screen(maxWidth: HeaderState.mobileBreakpoint.px), [
          css('.header-web-padding').styles(
            padding: Padding.only(
                left: 0.percent, right: 0.percent, bottom: 0.percent),
            flexDirection: FlexDirection.column,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
          ),
          css('.text-header-web', [
            css('&').styles(
              display: Display.flex,
              width: 100.percent,
              flexDirection: FlexDirection.column,
              justifyContent: JustifyContent.center,
              alignItems: AlignItems.center,
            ),
          ]),
          css('.w500-60-custom', [
            css('&').styles(
              color: AppColors.textBlack,
              textAlign: TextAlign.center,
              fontFamily: FontFamily.list(
                  [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
              fontSize: 60.px,
              fontWeight: FontWeight.w500,
            ),
          ]),
          css('.w400-20-custom', [
            css('&').styles(
              color: AppColors.textBlack,
              textAlign: TextAlign.center,
              fontFamily: FontFamily.list(
                  [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
              fontSize: 20.px,
              fontWeight: FontWeight.w400,
            ),
          ]),
          css('.primary_image').styles(
            width: 100.percent,
            height: 500.px,
          ),
          css.media(MediaQuery.screen(maxWidth: 1000.px), [
            css('.header-web', [
              css('&').styles(
                padding: Padding.symmetric(
                  horizontal: 3.percent,
                ),
              ),
            ]),
          ])
        ]),
      ];
}
