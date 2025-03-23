import 'dart:async';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:my_website/components/common/menu_button.dart';
import 'package:my_website/constants/app_colors.dart';
import 'package:my_website/constants/image_constant.dart';
import 'package:my_website/constants/theme_toogle.dart';
import 'package:my_website/utils/events.dart';
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

  StreamSubscription? sub;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      captureVisit();
      sub = web.EventStreamProviders.resizeEvent
          .forTarget(web.window)
          .listen((e) {
        if (menuOpen && web.window.innerWidth > mobileBreakpoint) {
          setState(() {
            menuOpen = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = context.url;
    var content = Fragment(key: contentKey, children: [
      // Navigation bên phải
      nav(classes: 'nav-menu', [
        for (var route in [
          (label: 'About us', path: '/'),
          (label: 'Services', path: '/'),
          (label: 'Contact', path: '/'),
          (label: 'Careers', path: '/'),
        ])
          div([
            Link(to: route.path, child: text(route.label)),
          ]),
        div(classes: "language-header", [
          Link(to: '/about', child: text("English")),
        ]),
        div(classes: "theme_toggle", [
          ThemeToggle(),
        ]),
      ]),
    ]);

    yield header([
      img(
        src: Images.imagePrimary,
        styles: Styles(
          width: Unit.pixels(36),
          height: Unit.pixels(36),
          margin: Margin.only(left: 5.percent),
          color: AppColors.textBlack,
        ),
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
        // position: Position.absolute(left: Unit.zero, right: Unit.zero),
        zIndex: ZIndex(1),
        width: 100.vw,
        padding: Padding.only(
          top: 2.rem,
        ),
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        // gap: Gap(column: 2.rem),
      ),
      css('& > *').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
      ),

      // css('.header-container', [
      //   css('&').styles(
      //     width: Unit.vw(100),
      //   ),
      // ]),
      // css('.head_padding').styles(
      //   display: Display.flex,
      //   height: 68.px,
      //   // width: Unit.vw(100),
      //   padding: Padding.only(top: 66.px, left: 100.px, right: 100.px),
      //   flexDirection: FlexDirection.row,
      //   justifyContent: JustifyContent.spaceBetween,
      //   alignItems: AlignItems.center,
      // ),
      // Style cho menu
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
      css('.language-header', [
        css('&').styles(
          display: Display.flex,
          height: 68.px,
          padding: Padding.symmetric(horizontal: 15.px),
          border:
              Border.all(BorderSide(color: AppColors.textBlack, width: 1.px)),
          radius: BorderRadius.circular(14.px),
          alignItems: AlignItems.center,
          color: AppColors.primaryColor,
          fontFamily: FontFamily.list(
              [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
          fontSize: 20.px,
          fontWeight: FontWeight.w400,
          textDecoration: TextDecoration.none,
        )
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
