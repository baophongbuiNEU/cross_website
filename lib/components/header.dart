import 'dart:async' show StreamSubscription, scheduleMicrotask;

import 'package:cross_website/constants/theme_toogle.dart';
import 'package:cross_website/langguage.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:cross_website/components/common/menu_button.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/utils/events.dart';
import 'package:universal_web/web.dart' as web;

class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  static const mobileBreakpoint = 1000;

  final contentKey = GlobalKey();
  bool menuOpen = false;

  StreamSubscription? screenSizeSub;

  @override
  void initState() {
    super.initState();
    resizedWebsite();
  }

  @override
  void dispose() {
    screenSizeSub?.cancel();
    super.dispose();
  }

  void resizedWebsite() {
    if (!kIsWeb) return;
    captureVisit();
    screenSizeSub =
        web.EventStreamProviders.resizeEvent.forTarget(web.window).listen((e) {
      if (menuOpen && web.window.innerWidth > mobileBreakpoint) {
        setState(() {
          menuOpen = false;
        });
      }
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final currentUrl = context.url;
    final currentHash = Uri.parse(currentUrl).fragment;
    if (currentHash.isNotEmpty && kIsWeb) {
      scheduleMicrotask(() {});
    }
    var content = Fragment(key: contentKey, children: [
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
              div(classes: "theme_toggle", [
                ThemeToggle(),
              ]),
            ];
          },
        ),
      ]),
    ]);

    yield header([
      img(
        src: Images.imagePrimary,
        styles: Styles(
            width: Unit.pixels(36),
            height: Unit.pixels(36),
            padding: Padding.all(.7.rem),
            margin: Margin.only(left: 5.percent),
            radius: BorderRadius.circular(8.px),
            color: AppColors.textBlack,
            backgroundColor: AppColors.listLogoBackground),
      ),
      if (!menuOpen) content,
      MenuButton(
        onClick: () {
          setState(() {
            menuOpen = !menuOpen;
          });
        },
        child: menuOpen ? content : null,
      ),
    ]);
  }

  @css
  static final styles = [
    css.import(
        "https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&display=swap"),
    css('header', [
      css('&').styles(
        display: Display.flex,
        zIndex: ZIndex(1),
        width: 100.vw,
        padding: Padding.only(
          top: 2.rem,
        ),
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
      ),
      css('& > *').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
      ),
      css('.nav-menu a', [
        css('&').styles(
            margin: Margin.symmetric(horizontal: 20.px),
            color: AppColors.textBlack,
            fontFamily: FontFamily.list(
                [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
            fontSize: 20.px,
            fontWeight: FontWeight.w400,
            textDecoration: TextDecoration.none),
      ]),
      css('.nav-menu', [
        css('&').styles(
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
        ),
      ]),
      css('.nav-menu div', [
        css('&').styles(display: Display.flex, alignItems: AlignItems.center),
      ]),
    ]),
    css('.theme_toggle').styles(
      margin: Spacing.only(left: 5.px, right: 2.rem),
    ),
    css.media(MediaQuery.screen(maxWidth: mobileBreakpoint.px), [
      css('header', [
        css('&').styles(
          display: Display.flex,
          width: 100.vw,
          justifyContent: JustifyContent.spaceBetween,
        ),
        css('& > .nav-menu').styles(display: Display.none),
        css('& > nav').styles(display: Display.none),
      ]),
      css('.theme_toggle').styles(
        margin: Spacing.only(left: 0.px, right: 0.rem),
      ),
    ]),
  ];
}
