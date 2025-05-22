import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:universal_web/web.dart' as web;

class CookieConsentBanner extends StatelessComponent {
  const CookieConsentBanner({super.key});

  bool get isDarkMode {
    if (!kIsWeb) return false;
    final className = web.document.documentElement?.className ?? '';
    return className.split(' ').contains('dark');
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final hasConsent =
        context.watch<bool>(LanguageManager.cookieConsentProvider);
    if (hasConsent) return;

    final isDark = isDarkMode;
    final backgroundColor =
        isDark ? Color.hex('#FFFFFF') : Color.hex('#000000');
    final textColor = isDark ? Color.hex('#000000') : Color.hex('#FFFFFF');
    final borderColor = isDark ? Color.hex('#333333') : Color.hex('#e0e0e0');
    final accentColor = Color.hex('#f5a623');
    final shadowColor = 'rgba(0, 0, 0, 0.3)';

    yield div(
      styles: Styles(
        raw: {
          'position': 'fixed',
          'bottom': '30px',
          'left': '50%',
          'transform': 'translateX(-50%)',
          'background-color': backgroundColor.value,
          'color': textColor.value,
          'padding': '15px 15px',
          'border-radius': '16px',
          'display': 'flex',
          'align-items': 'center',
          'justify-content': 'space-between',
          'box-shadow': '0 4px 12px $shadowColor',
          'font-family': 'Arial, sans-serif',
          'z-index': '1000',
          'max-width': '800px',
          'gap': '20px',
          'border': '1px solid ${borderColor.value}',
        },
      ),
      [
        div(
          styles: Styles(
            raw: {
              'display': 'flex',
              'flex-direction': 'column',
              'gap': '6px',
              'max-width': '500px',
            },
          ),
          [
            text('We use cookies to improve your experience.'),
            span([
              text('Learn more in our '),
              a(
                href: '/privacy-policy',
                styles: Styles(
                  raw: {
                    'color': accentColor.value,
                    'text-decoration': 'none',
                  },
                ),
                [text('Privacy Policy')],
              ),
              text('.'),
            ]),
          ],
        ),
        div(
          styles: Styles(
            raw: {
              'display': 'flex',
              'gap': '12px',
            },
          ),
          [
            button(
              styles: Styles(
                raw: {
                  'background-color': 'transparent',
                  'color': textColor.value,
                  'border': '1px solid ${textColor.value}',
                  'padding': '8px 20px',
                  'border-radius': '24px',
                  'cursor': 'pointer',
                  'font-weight': 'bold',
                },
              ),
              events: {
                'click': (_) {
                  print('Decline button clicked');
                  LanguageManager.setCookieConsent(false, context);
                  return;
                },
              },
              [text('Decline')],
            ),
            button(
              styles: Styles(
                raw: {
                  'background-color': textColor.value,
                  'color': backgroundColor.value,
                  'border': 'none',
                  'padding': '8px 20px',
                  'border-radius': '24px',
                  'cursor': 'pointer',
                  'font-weight': 'bold',
                },
              ),
              events: {
                'click': (_) {
                  print('Accept button clicked');
                  LanguageManager.setCookieConsent(true, context);
                  return;
                },
              },
              [text('Accept')],
            ),
          ],
        ),
      ],
    );
  }
}
