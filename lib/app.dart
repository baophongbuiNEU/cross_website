import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:my_website/components/header.dart';
import 'package:my_website/constants/app_colors.dart';

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
        // height: 100.vh,
        overflow: Overflow.hidden,
        flexDirection: FlexDirection.column,
        flexWrap: FlexWrap.wrap,
        justifyContent: JustifyContent.center,
        backgroundColor: AppColors.backgroundTheme,
        // alignItems: AlignItems.center,
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
