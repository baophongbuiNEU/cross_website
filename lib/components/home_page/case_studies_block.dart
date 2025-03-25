import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';

class CaseStudiesBlock extends StatelessComponent {
  const CaseStudiesBlock({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable: LanguageManager.selectedLanguage,
      builder: (context, lang) sync* {
        yield div(
          styles: Styles(
            padding: Padding.symmetric(horizontal: 100.px),
          ),
          [
            div(
              styles: Styles(
                display: Display.flex,
                padding: Padding.symmetric(horizontal: 60.px, vertical: 70.px),
                radius: BorderRadius.circular(45.px),
                flexDirection: FlexDirection.row,
                justifyContent: JustifyContent.spaceBetween,
                backgroundColor: AppColors.primaryColor,
              ),
              [
                _item(
                  content:
                      LanguageManager.translate('case_studies_case1_content'),
                ),
                _line(),
                _item(
                  content:
                      LanguageManager.translate('case_studies_case2_content'),
                ),
                _line(),
                _item(
                  content:
                      LanguageManager.translate('case_studies_case3_content'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Component _item({required String content}) {
    return div(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
      ),
      [
        div(
          styles: Styles(
            color: AppColors.white,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
          ),
          [Text(content)],
        ),
        SizeBoxComponent(height: 20),
        div(
          styles: Styles(
            display: Display.flex,
            flexDirection: FlexDirection.row,
          ),
          [
            div(
              styles: Styles(
                color: AppColors.greenPrimary,
                fontSize: 20.px,
                fontWeight: FontWeight.w400,
              ),
              [Text(LanguageManager.translate('case_studies_learn_more'))],
            ),
            SizeBoxComponent(width: 15),
            img(src: Images.learnMoreGreenIcon, width: 18, height: 18),
          ],
        ),
      ],
    );
  }

  Component _line() {
    return div(
      styles: Styles(
        width: 1.px,
        margin: Margin.symmetric(horizontal: 64.px),
        radius: BorderRadius.circular(2.px),
        backgroundColor: AppColors.white,
      ),
      [],
    );
  }
}
