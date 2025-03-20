import 'package:jaspr/jaspr.dart';
import 'package:my_website/components/common/button_primary_black.dart';
import 'package:my_website/constants/app_colors.dart';
import 'package:my_website/constants/image_constant.dart';
import 'package:my_website/language/language_manager.dart';

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
                        text(LanguageManager.getTranslation(
                            'cta_block', 'title')),
                      ],
                    ),
                    div(
                      styles: Styles(
                        color: AppColors.primaryColor,
                        fontSize: 18.px,
                        fontWeight: FontWeight.w400,
                      ),
                      [
                        text(LanguageManager.getTranslation(
                            'cta_block', 'description')),
                      ],
                    ),
                    ButtonPrimaryBlack(
                      text: LanguageManager.getTranslation(
                          'cta_block', 'button_text'),
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
}
