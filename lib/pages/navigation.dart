import 'package:cross_website/widgets/language.dart';
import 'package:jaspr/jaspr.dart';

class Navigation extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    final languageProvider = LanguageProvider.of(context);
    final currentLanguage = languageProvider.language;
    final otherLanguage = currentLanguage == 'EN' ? 'FR' : 'EN';

    yield div(
        classes: 'navigation',
        styles: Styles(
          display: Display.flex,
          padding: Padding.symmetric(horizontal: 20.px, vertical: 10.px),
          justifyContent: JustifyContent.spaceBetween,
          alignItems: AlignItems.center,
          backgroundColor: Color('#f0f0f0'),
        ),
        [
          div(classes: 'nav-links', [
            a(href: '/about', [text('About Us')]),
            a(href: '/services', [text('Services')]),
            a(href: '/contact', [text('Contact')]),
            a(href: '/careers', [text('Careers')]),
          ]),
          button(
            classes: 'language-btn',
            events: {
              'click': (click) => languageProvider.setLanguage(otherLanguage)
            },
            [text(currentLanguage)],
          ),
        ]);
  }
}
