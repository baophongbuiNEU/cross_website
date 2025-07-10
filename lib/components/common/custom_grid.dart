import 'package:jaspr/jaspr.dart';

class CustomGrid extends StatelessComponent {
  List<Component> children;
  CustomGrid({required this.children, super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(id: 'customs', [
      div(classes: 'custom-grid', children),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('#customs', [
          css('&').styles(
            display: Display.flex,
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.center,
            gap: Gap.all(1.5.rem),
            textAlign: TextAlign.center,
          ),
          css('.custom-grid', [
            css('&').styles(
              display: Display.flex,
              maxWidth: Unit.rem(100),
              margin: Margin.only(
                bottom: 1.5.rem,
              ),
              flexDirection: FlexDirection.row,
              flexWrap: FlexWrap.wrap,
              gap: Gap.all(1.5.rem),
            ),
            css('& > *').styles(
              boxSizing: BoxSizing.borderBox,
              flex: Flex(grow: 1, shrink: 0, basis: Unit.rem(15)),
            ),
          ]),
        ]),
      ];
}
