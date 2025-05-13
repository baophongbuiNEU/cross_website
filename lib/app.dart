// ignore_for_file: depend_on_referenced_packages

import 'package:cross_website/components/header.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/pages/not_found_page.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/about.dart';
import 'pages/home.dart';

@client
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ProviderScope(child: _App());
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

class _App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'main', [
      // Header(),
      Router(
        routes: [
          Route(
            path: '/',
            title: 'Home',
            builder: (context, state) => div(classes: 'main', [
              Header(),
              const Home(),
            ]),
          ),
          Route(
            path: '/about',
            title: 'About',
            builder: (context, state) => div(classes: 'main', [
              Header(),
              const About(),
            ]),
          ),
          Route(
            path: '/:path',
            builder: (context, state) {
              final currentPath = state.path;
              if (currentPath != '/' && currentPath != '/about') {
                return const NotFoundPage();
              }
              return div([]);
            },
          ),
        ],
      ),
    ]);
  }
}
