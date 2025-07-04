import 'package:jaspr/jaspr.dart';

class AppColors {
  static const Color primaryColor = Color.variable('--primaryColor');
  static const Color white = Color.variable('--white');
  static const Color greenPrimary = Color.variable('--greenPrimary');
  static const Color backgroundWhite = Color.variable('--backgroundWhite');
  static const Color background292A32 = Color.variable('--background292A32');
  static const Color textBlack = Color.variable('--textBlack');
  static const Color hoverOverlayColor = Color.variable('--hoverOverlayColor');
  static const Color hoverOverlayMenuButton =
      Color.variable('--hoverOverlayMenuButton');
  static const Color listLogoBackground =
      Color.variable('--listLogoBackground');
  static const Color backgroundFaded = Color.variable('--backgroundFaded');
  static const Color backgroundTheme = Color.variable('--backgroundTheme');
}

final lightTheme = {
  AppColors.primaryColor: Color('#191A23'),
  AppColors.white: Color('#FFFFFF'),
  AppColors.greenPrimary: Color('#64B6F7'),
  AppColors.backgroundWhite: Color('#F3F3F3'),
  AppColors.background292A32: Color('#292A32'),
  AppColors.textBlack: Color('#222'),
  AppColors.hoverOverlayColor: Color('#0001'),
  AppColors.hoverOverlayMenuButton: Color('#0001'),
  AppColors.listLogoBackground: Colors.transparent,
  AppColors.backgroundFaded: Color('#FFF9'),
  AppColors.backgroundTheme: Colors.white,
};

final darkTheme = {
  AppColors.primaryColor: Color('#191A23'),
  AppColors.white: Color('#222'),
  AppColors.greenPrimary: Color('#64B6F7'),
  AppColors.backgroundWhite: Color('#000000'),
  AppColors.background292A32: Color('#292A32'),
  AppColors.textBlack: Color('#F5F5F5'),
  AppColors.hoverOverlayColor: Color('#FFF1'),
  AppColors.hoverOverlayMenuButton: Colors.lightGrey,
  AppColors.listLogoBackground: Color('#FFFFFF'),
  AppColors.backgroundFaded: Color('#0d111799'),
  AppColors.backgroundTheme: Colors.black,
};

const maxContentWidth = Unit.rem(70);
const mobileBreakpoint = Unit.rem(40);
const smallMobileBreakpoint = Unit.rem(25);

@css
List<StyleRule> get root => [
      css.import('font/lucide/lucide.css'),

      // Global
      css('html, body').styles(padding: Padding.zero, margin: Margin.zero),
      css('html').styles(
        backgroundColor: AppColors.backgroundWhite,
      ),
      // Theme
      css(':root').styles(raw: {
        ...{
          for (final color in lightTheme.keys)
            color.value.substring(4, color.value.length - 1):
                lightTheme[color]!.value,
        },
        '--contentPadding': '4rem',
        '--sectionPadding': '16rem',
        '--gradientBackground':
            'linear-gradient(to top right, #ffffff 0%, #f8f9ff 30%, #e6ebff 70%, #93c5fd 100%)',
        '--sectionAltBackground':
            'linear-gradient(135deg, #f9fafb, #f0fdff, #eff6ff)',
        '--footerAltBackground': '#eff6ff',
        '--cardBackground': 'rgba(255, 255, 255, 0.8)',
        '--cardBorder': 'rgba(255, 255, 255, 0.2)',
        '--cardDescriptionColor': '#6b7280',
        '--cultureSubtitleColor': '#4b5563',
        '--quoteTextColor': '#1f2937',
      }),
      css(':root.dark').styles(raw: {
        for (final color in darkTheme.keys)
          color.value.substring(4, color.value.length - 1):
              darkTheme[color]!.value,
        '--gradientBackground':
            'linear-gradient(to top right, #000000 0%, #1a1a2e 30%, #16213e 70%, #0f3460 100%)',
        '--sectionAltBackground':
            'linear-gradient(135deg, #1f2937, #111827, #0f172a)',
        '--footerAltBackground': '#0f172a',
        '--cardBackground': 'transparent',
        '--cardBorder': '#64B6F7',
        '--cardDescriptionColor': '#ffffff',
        '--cultureSubtitleColor': '#ffffff',
        '--quoteTextColor': '#ffffff',
      }),

      css.media(MediaQuery.all(maxWidth: mobileBreakpoint), [
        css(':root').styles(raw: {
          '--contentPadding': '2rem',
          '--sectionPadding': '8rem',
        }),
      ]),

      css.media(MediaQuery.all(maxWidth: smallMobileBreakpoint), [
        css(':root').styles(raw: {
          '--contentPadding': '1rem',
          '--sectionPadding': '4rem',
        }),
      ]),
    ];
