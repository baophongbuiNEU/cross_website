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
  AppColors.greenPrimary: Color('#35DAFF'),
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
  AppColors.greenPrimary: Color('#B9FF66'),
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
final root = [
  css.import('font/lucide/lucide.css'),

  // Global
  css('html, body').styles(padding: Padding.zero, margin: Margin.zero),
  css('html').styles(
    backgroundColor: AppColors.backgroundWhite,
  ),

  // Theme
  css(':root').styles(raw: {
    for (final color in lightTheme.keys)
      color.value.substring(4, color.value.length - 1):
          lightTheme[color]!.value,
    '--contentPadding': '4rem',
    '--sectionPadding': '16rem',
  }),

  css(':root.dark').styles(raw: {
    for (final color in darkTheme.keys)
      color.value.substring(4, color.value.length - 1): darkTheme[color]!.value,
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
