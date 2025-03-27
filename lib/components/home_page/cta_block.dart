import 'package:cross_website/components/common/button_primary_black.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:cross_website/components/common/button_primary_black.dart';
import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';

class CtaBlock extends StatelessComponent {
  const CtaBlock({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable: LanguageManager.selectedLanguage,
      builder: (context, lang) sync* {
        yield div(
          styles: Styles(
            height: 350.px,
            padding: Padding.symmetric(vertical: 60.px, horizontal: 100.px),
          ),
          [
            div(
              styles: Styles(
                display: Display.flex,
                height: 108.percent,
                radius: BorderRadius.circular(45.px),
                flexDirection: FlexDirection.row,
                justifyContent: JustifyContent.spaceBetween,
                backgroundColor: AppColors.backgroundWhite,
              ),
              [
                div(
                  styles: Styles(
                    display: Display.flex,
                    width: 40.percent,
                    padding: Padding.all(60.px),
                    flexDirection: FlexDirection.column,
                    justifyContent: JustifyContent.spaceBetween,
                  ),
                  [
                    div(
                      styles: Styles(
                        color: AppColors.primaryColor,
                        fontSize: 30.px,
                        fontWeight: FontWeight.w500,
                      ),
                      [
                        text(LanguageManager.translate('cta_title')),
                      ],
                    ),
                    div(
                      styles: Styles(
                        color: AppColors.primaryColor,
                        fontSize: 18.px,
                        fontWeight: FontWeight.w400,
                      ),
                      [
                        text(LanguageManager.translate('cta_description')),
                      ],
                    ),
                    ButtonPrimaryBlack(
                      text: LanguageManager.translate('cta_button_text'),
                    ),
                  ],
                ),
                div(
                  styles: Styles(
                    display: Display.flex,
                    width: 55.percent,
                    padding: Padding.only(right: 60.px),
                    justifyContent: JustifyContent.center,
                    alignItems: AlignItems.center,
                  ),
                  [
                    img(
                      src: Images.ctaBlockImage,
                      height: 400,
                      attributes: {'alt': 'CTA Image'},
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @css
  static final style = [
    css('.cta_overall', [
      css('&').styles(
        width: 100.vw,
        margin: Margin.symmetric(vertical: 100.px),
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
        alignSelf: AlignSelf.center,
      ),
    ]),
    css('.cta_block', [
      css('&').styles(
        display: Display.flex,
        height: 100.percent,
        margin: Margin.symmetric(horizontal: 5.percent),
        radius: BorderRadius.circular(45.px),
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        backgroundColor: AppColors.backgroundWhite,
      ),
    ]),
    css('.cta_text', [
      css('&').styles(
        display: Display.flex,
        width: 40.percent,
        padding: Spacing.all(60.px),
        flexDirection: FlexDirection.column,
      )
    ]),
    css('.cta_image').styles(
      display: Display.flex,
      width: 50.percent,
      justifyContent: JustifyContent.center,
      alignItems: AlignItems.center,
      alignSelf: AlignSelf.center,
      backgroundColor: AppColors.listLogoBackground,
    ),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.cta_block', [
        css('&').styles(
          padding: Padding.symmetric(horizontal: 20.px),
          flexDirection: FlexDirection.column,
        ),
      ]),
      css('.cta_text', [
        css('&').styles(
          width: 100.percent,
          alignItems: AlignItems.center,
          textAlign: TextAlign.center,
        )
      ]),
      css('.cta_image', [
        css('&').styles(
          width: 100.percent,
          margin: Spacing.only(bottom: 20.px),
        )
      ])
    ]),
  ];
}
