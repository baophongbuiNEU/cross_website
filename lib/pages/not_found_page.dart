import 'package:jaspr/jaspr.dart';

@client
class NotFoundPage extends StatelessComponent {
  const NotFoundPage();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(classes: 'not-found', [
      h1([text('404 - Page Not Found')]),
      p([text('Sorry, the page you are looking for does not exist.')]),
      a(
        href: '/',
        [text('← Go back to homepage')],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.not-found', [
          css('&').styles(
            display: Display.flex,
            minHeight: 100.vh,
            padding: Spacing.symmetric(horizontal: 20.px),
            margin: Spacing.zero,
            boxSizing: BoxSizing.borderBox,
            flexDirection: FlexDirection.column,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            fontFamily: FontFamily("sans-serif"),
            backgroundColor: Color.rgb(245, 245, 245),
          ),
          css('h1').styles(
            margin: Spacing.zero,
            color: Color.rgb(200, 0, 0),
            fontSize: 50.px,
          ),
          css('p').styles(
            margin: Margin.only(bottom: 20.px, top: 10.px),
            fontSize: 20.px,
          ),
          css('a').styles(
            color: Color.rgb(0, 100, 255),
            fontSize: 18.px,
            textDecoration: TextDecoration(line: TextDecorationLine.none),
          ),
        ]),
      ];
}
