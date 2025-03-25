import 'dart:async' show scheduleMicrotask;
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final currentUrl = context.url;
    final currentHash = Uri.parse(currentUrl).fragment;
    if (currentHash.isNotEmpty && kIsWeb) {
      scheduleMicrotask(() {});
    }

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
                      label: LanguageManager.translate('header_about'),
                      path: '/about'
                    ),
                    (
                      label: LanguageManager.translate('header_services'),
                      path: '/#services'
                    ),
                    (
                      label: LanguageManager.translate('header_contact'),
                      path: '/#contact'
                    ),
                    (
                      label: LanguageManager.translate('header_careers'),
                      path: '/#careers'
                    ),
                  ])
                    div([
                      if (route.path == '/about')
                        Link(
                          to: route.path,
                          children: [text(route.label)],
                        )
                      else
                        a(href: route.path, events: {
                          'click': (event) {},
                        }, [
                          text(route.label)
                        ]),
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
