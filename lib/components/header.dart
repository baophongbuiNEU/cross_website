import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:my_website/constants/image_constant.dart';
import 'package:my_website/language/language_manager.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = context.url;

    yield header([
      div(classes: 'header-container', [
        div(classes: 'head_padding', [
          img(
            src: Images.imagePrimary,
            styles: Styles(width: Unit.pixels(36), height: Unit.pixels(36)),
          ),
          nav(classes: 'nav-menu', [
            ValueListenableBuilder<String>(
              listenable: LanguageManager.selectedLanguage,
              builder: (context, lang) sync* {
                yield* [
                  for (var route in [
                    (
                      label: LanguageManager.getTranslation('header', 'about'),
                      path: '/'
                    ),
                    (
                      label:
                          LanguageManager.getTranslation('header', 'services'),
                      path: '/'
                    ),
                    (
                      label:
                          LanguageManager.getTranslation('header', 'contact'),
                      path: '/'
                    ),
                    (
                      label:
                          LanguageManager.getTranslation('header', 'careers'),
                      path: '/'
                    ),
                  ])
                    div([
                      Link(to: route.path, child: text(route.label)),
                    ]),
                  LanguageManager.languageDropdown(),
                ];
              },
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static final styles = [
    css.import(
        "https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&display=swap"),
    css('.header-container', [
      css('&').styles(
        width: Unit.vw(100),
      ),
    ]),
    css('.head_padding').styles(
      display: Display.flex,
      height: 68.px,
      padding: Padding.only(top: 66.px, left: 100.px, right: 100.px),
      flexDirection: FlexDirection.row,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
    ),
    css('.nav-menu a', [
      css('&').styles(
          margin: Margin.symmetric(horizontal: 20.px),
          color: Colors.black,
          fontFamily: FontFamily.list(
              [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
          fontSize: 20.px,
          fontWeight: FontWeight.w400,
          textDecoration: TextDecoration.none),
      css('&.active').styles(
        color: Colors.blue,
        fontWeight: FontWeight.w700,
      ),
    ]),
    css('.nav-menu', [
      css('&').styles(
        display: Display.flex,
      ),
    ]),
    css('.nav-menu div', [
      css('&').styles(display: Display.flex, alignItems: AlignItems.center),
    ]),
  ];
}
