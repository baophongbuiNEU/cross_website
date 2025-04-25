import 'package:cross_website/pages/navigation.dart';
import 'package:jaspr/jaspr.dart';

class Layout extends StatelessComponent {
  final Component child;

  const Layout({required this.child});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'layout', [
      Navigation(),
      div(
          classes: 'content',
          styles: const Styles.raw({
            'padding': '20px',
          }),
          [child]),
    ]);
  }
}
