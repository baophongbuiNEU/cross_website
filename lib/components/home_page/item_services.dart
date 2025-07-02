import 'package:jaspr/jaspr.dart';
import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';

class ItemServices extends StatelessComponent {
  final Color? backgroundColor;
  final Color? backgroundText;
  final Color? titleColor;
  final Color? contentColor;
  final Color? backgroundItem;
  final Color? itemColor;
  final String? title;
  final String? content;
  final Component? iconComponent;
  final String? itemBig;

  const ItemServices(
      {this.title,
      this.itemBig,
      this.content,
      this.iconComponent,
      this.backgroundColor,
      this.backgroundText,
      this.titleColor,
      this.contentColor,
      this.backgroundItem,
      this.itemColor,
      super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
        styles: Styles(
            display: Display.flex,
            width: 100.percent,
            padding: Padding.all(50.px),
            border: Border(width: 1.px, color: AppColors.primaryColor),
            radius: BorderRadius.circular(45.px),
            shadow: BoxShadow(
                offsetX: 0.px, offsetY: 5.px, color: AppColors.primaryColor),
            flexDirection: FlexDirection.row,
            justifyContent: JustifyContent.spaceBetween,
            backgroundColor: backgroundColor ?? AppColors.backgroundWhite),
        [
          div(classes: 'service_content', [
            div(
              classes: 'service_word',
              [
                for (var word in (title ?? "").split(' '))
                  span(
                    styles: Styles(
                      padding:
                          Padding.symmetric(horizontal: 6.px, vertical: 4.px),
                      radius: BorderRadius.circular(4.px),
                      color: titleColor ?? AppColors.primaryColor,
                      fontSize: 30.px,
                      fontWeight: FontWeight.w500,
                      backgroundColor: backgroundText ?? AppColors.greenPrimary,
                    ),
                    [Text(word)],
                  ),
              ],
            ),
            SizeBoxComponent(height: 20),
            div(
                styles: Styles(
                    display: Display.flex,
                    width: 230.px,
                    flexDirection: FlexDirection.row,
                    alignItems: AlignItems.center),
                [
                  iconComponent ??
                      img(
                          height: 20,
                          width: 20,
                          src: Icons.upRightArrowIcon,
                          styles: Styles(
                              padding: Padding.all(10.px),
                              radius: BorderRadius.circular(20.px),
                              backgroundColor: Colors.white)),
                  SizeBoxComponent(width: 15),
                  div(
                      styles: Styles(
                          color: contentColor ?? AppColors.primaryColor,
                          textAlign: TextAlign.start,
                          fontSize: 20.px,
                          fontWeight: FontWeight.w400),
                      [Text(content ?? "")])
                ])
          ]),
          itemBig != null
              ? img(
                  classes: 'service_image',
                  src: itemBig!,
                  height: 200,
                  width: 200)
              : div([])
        ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.service_content', [
          css('&').styles(
              display: Display.flex,
              width: 45.percent,
              flexDirection: FlexDirection.column,
              justifyContent: JustifyContent.spaceBetween),
        ]),
        css('.service_word', [
          css('&').styles(
            display: Display.flex,
            width: 230.px,
            padding: Padding.symmetric(horizontal: 10.px),
            radius: BorderRadius.circular(8.px),
            flexWrap: FlexWrap.wrap,
            textAlign: TextAlign.start,
          )
        ]),
        css.media(MediaQuery.screen(maxWidth: 1254.px), [
          css('.service_word', [
            css('&').styles(
              width: 100.percent,
            )
          ]),
        ]),
        css.media(MediaQuery.screen(maxWidth: 600.px), [
          css('.service_content', [
            css('&').styles(
              width: 100.percent,
              alignItems: AlignItems.center,
            ),
          ]),
          css('.service_word', [
            css('&').styles(
              width: 100.percent,
              justifyContent: JustifyContent.center,
              alignItems: AlignItems.center,
              textAlign: TextAlign.center,
            )
          ]),
          css('.service_image', [
            css('&').styles(
              display: Display.none,
              width: 0.px,
              height: 0.px,
            )
          ])
        ]),
      ];
}
