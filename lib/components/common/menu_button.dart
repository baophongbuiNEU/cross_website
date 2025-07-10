import 'package:jaspr/jaspr.dart';
import 'package:cross_website/components/header.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';

class MenuButton extends StatelessComponent {
  const MenuButton({required this.onClick, required this.child, super.key});

  final void Function() onClick;
  final Component? child;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
        classes: 'menu-toggle',
        attributes: {'aria-label': 'Menu Toggle'},
        onClick: onClick,
        [
          img(
              src: child != null ? Images.closeIcon : Images.drawerIcon,
              styles: Styles(width: 40.px, height: 40.px))
        ]);
    if (child != null) {
      yield div(
        classes: 'menu-overlay',
        [child!],
      );
    }
  }

  @css
  static List<StyleRule> get styles => [
    css('.menu-toggle').styles(
      display: Display.none,
      padding: Padding.all(.7.rem),
      margin: Margin.only(right: 5.percent),
      border: Border.unset,
      radius: BorderRadius.circular(8.px),
      outline: Outline.unset,
      alignItems: AlignItems.center,
      color: AppColors.textBlack,
      fontSize: 1.5.rem,
      backgroundColor: AppColors.listLogoBackground,
    ),
    css('.menu-toggle:hover').styles(
      backgroundColor: AppColors.hoverOverlayMenuButton,
    ),
    css('.menu-overlay', [
      css('&').styles(
        display: Display.flex,
        position: Position.fixed(
            top: Unit.zero,
            left: Unit.zero,
            right: Unit.zero,
            bottom: Unit.zero),
        zIndex: ZIndex(100),
        padding: Padding.only(top: 7.rem),
        flexDirection: FlexDirection.columnReverse,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
        gap: Gap(row: 4.rem),
        backgroundColor: AppColors.backgroundFaded,
        raw: {
          'backdrop-filter': 'blur(5px)',
          '-webkit-backdrop-filter': 'blur(5px)'
        },
      ),
      css('nav', [
        css('&').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          alignItems: AlignItems.center,
          gap: Gap(row: 2.rem),
          flex: Flex(grow: 0),
        ),
        css('a').styles(fontSize: 2.rem),
      ]),
      css('.header-actions').styles(
        display: Display.flex,
        flexDirection: FlexDirection.row,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: HeaderState.mobileBreakpoint.px), [
      css('header', [
        css('.menu-toggle').styles(
          display: Display.flex,
          position: Position.relative(),
          zIndex: ZIndex(101),
        ),
      ]),
    ]),
  ];
}
