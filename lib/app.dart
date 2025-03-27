import 'package:cross_website/components/header.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/about.dart';
import 'pages/home.dart';

@client
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'main', [
      const Header(),
      Router(routes: [
        Route(
            path: '/',
            title: 'Home',
            builder: (context, state) => const Home()),
        Route(
            path: '/about',
            title: 'About',
            builder: (context, state) => const About()),
      ]),
    ]);
  }

  @css
  static final styles = [
    css('.main', [
      css('&').styles(
        display: Display.flex,
        width: 100.percent,
        maxWidth: 100.vw,
        boxSizing: BoxSizing.borderBox,
        overflow: Overflow.hidden,
        flexDirection: FlexDirection.column,
        flexWrap: FlexWrap.wrap,
        justifyContent: JustifyContent.center,
        backgroundColor: AppColors.backgroundTheme,
      ),
      css('section').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
        flex: Flex(grow: 1),
      ),
    ]),
  ];
}
