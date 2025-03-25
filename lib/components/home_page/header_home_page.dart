import 'package:cross_website/components/common/button_primary_black.dart';
import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';

class HeaderHomePage extends StatelessComponent {
  const HeaderHomePage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable: LanguageManager.selectedLanguage,
      builder: (context, lang) sync* {
        yield div(classes: 'header-web', [
          div(classes: 'header-web-padding', [
            div(classes: 'text-header-web', [
              div(classes: 'w500-60-custom', [
                text(LanguageManager.translate('header_home_page_title')),
              ]),
              SizeBoxComponent(height: 35),
              div(classes: 'w400-20-custom', [
                text(
                  LanguageManager.translate('header_home_page_subtitle'),
                ),
              ]),
              SizeBoxComponent(height: 35),
              ButtonPrimaryBlack(
                text: LanguageManager.translate('header_home_page_button'),
              ),
            ]),
            img(src: Images.imageHeader, styles: Styles(height: 515.px)),
          ]),
        ]);
      },
    );
  }

  @css
  static final styles = [
    css.import(
        "https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&display=swap"),
    css('.header-web', [
      css('&').styles(
        display: Display.flex,
        position: Position.relative(),
        width: 100.vw,
      ),
    ]),
    css('.header-web-padding', [
      css('&').styles(
        display: Display.flex,
        width: 100.percent,
        padding: Padding.symmetric(horizontal: 100.px, vertical: 70.px),
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.start,
      ),
    ]),
    css('.text-header-web', [
      css('&').styles(
        display: Display.flex,
        width: 40.percent,
        flexDirection: FlexDirection.column,
      ),
    ]),
    css('.w500-60-custom', [
      css('&').styles(
        fontFamily: FontFamily.list(
            [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
        fontSize: 60.px,
        fontWeight: FontWeight.w500,
      ),
    ]),
    css('.w400-20-custom', [
      css('&').styles(
        fontFamily: FontFamily.list(
            [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
        fontSize: 20.px,
        fontWeight: FontWeight.w400,
      ),
    ]),
  ];
}
