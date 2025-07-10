import 'package:jaspr/jaspr.dart';

class Divider extends StatelessComponent {
  const Divider({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'divider', []);
  }

  @css
  static List<StyleRule> get styles => [
    css('.divider').styles(
      width: 97.vw,
      height: 1.px,
      // margin: 8px 0;
      backgroundColor: Colors.lightGrey,
    ),
  ];
}
