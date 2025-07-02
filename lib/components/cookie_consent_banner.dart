import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class CookieConsentBanner extends StatelessComponent {
  const CookieConsentBanner({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final consent = context.watch<bool?>(LanguageManager.cookieConsentProvider);
    if (consent != null) {
      return;
    }

    final accentColor = Color('#f5a623');
    final shadowColor = 'rgba(0, 0, 0, 0.3)';

    yield div(
      styles: Styles(
        shadow: BoxShadow(
            color: Color(shadowColor),
            blur: 12.px,
            offsetX: 0.px,
            offsetY: 4.px),
        backgroundColor: AppColors.textBlack,
        raw: {
          'position': 'fixed',
          'bottom': '30px',
          'left': '50%',
          'transform': 'translateX(-50%)',
          'padding': '15px 15px',
          'border-radius': '16px',
          'display': 'flex',
          'align-items': 'center',
          'justify-content': 'space-between',
          'font-family': 'Arial, sans-serif',
          'z-index': '1000',
          'max-width': '800px',
          'gap': '20px',
          // 'border': '1px solid ${borderColor.value}',
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
            p(
                styles: Styles(
                    display: Display.flex,
                    padding: Spacing.all(0.px),
                    margin: Spacing.all(0.px),
                    flexWrap: FlexWrap.wrap,
                    color: AppColors.backgroundTheme),
                [text('We use cookies to improve your experience.')]),
            div(
                styles: Styles(
                  display: Display.flex,
                  flexDirection: FlexDirection.row,
                  flexWrap: FlexWrap.wrap,
                ),
                [
                  p(
                      styles: Styles(
                          display: Display.flex,
                          padding: Spacing.all(0.px),
                          margin: Spacing.all(0.px),
                          flexWrap: FlexWrap.wrap,
                          color: AppColors.backgroundTheme),
                      [
                        text('Learn more in our'),
                      ]),
                  SizeBoxComponent(width: 5),
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
                border: Border(color: AppColors.backgroundTheme, width: 1.px),
                cursor: Cursor.pointer,
                color: AppColors.backgroundTheme,
                backgroundColor: Colors.transparent,
                raw: {
                  'padding': '8px 20px',
                  'border-radius': '24px',
                  'font-weight': 'bold'
                },
              ),
              events: {
                'click': (_) {
                  LanguageManager.setCookieConsent(false, context);
                  return;
                },
              },
              [text('Decline')],
            ),
            button(
              styles: Styles(
                color: AppColors.textBlack,
                backgroundColor: AppColors.backgroundTheme,
                raw: {
                  'border': 'none',
                  'padding': '8px 20px',
                  'border-radius': '24px',
                  'cursor': 'pointer',
                  'font-weight': 'bold'
                },
              ),
              events: {
                'click': (_) {
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