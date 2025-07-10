import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class CaseStudiesBlock extends StatelessComponent {
  const CaseStudiesBlock({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang =
        context.watch(LanguageManager.selectedLanguageProvider);

    yield div(classes: 'case_studies_block', [
      div(classes: 'inner_block', [
        _item(
          content: LanguageManager.translate(
              'case_studies_case1_content', selectedLang),
        ),
        _line(),
        _item(
          content: LanguageManager.translate(
              'case_studies_case2_content', selectedLang),
        ),
        _line(),
        _item(
          content: LanguageManager.translate(
              'case_studies_case3_content', selectedLang),
        ),
      ]),
    ]);
  }

  Component _item({required String content}) {
    return Builder(builder: (context) sync* {
      final selectedLang =
          context.watch(LanguageManager.selectedLanguageProvider);

      yield div(
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
                [
                  Text(LanguageManager.translate(
                      'case_studies_learn_more', selectedLang)),
                ],
              ),
              SizeBoxComponent(width: 15),
              img(src: Images.learnMoreBlueIcon, width: 25, height: 25),
            ],
          ),
          SizeBoxComponent(height: 20),
        ],
      );
    });
  }

  Component _line() {
    return div(classes: 'line', []);
  }

  @css
  static List<StyleRule> get style => [
        css('.case_studies_block', [
          css('&').styles(
            maxWidth: 100.percent,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            alignSelf: AlignSelf.center,
          ),
        ]),
        css('.inner_block', [
          css('&').styles(
            display: Display.flex,
            padding: Padding.symmetric(horizontal: 60.px, vertical: 70.px),
            margin: Spacing.symmetric(horizontal: 5.percent),
            radius: BorderRadius.circular(45.px),
            flexDirection: FlexDirection.row,
            justifyContent: JustifyContent.spaceBetween,
            backgroundColor: AppColors.textBlack,
          ),
        ]),
        css('.line', [
          css('&').styles(
            width: 1.px,
            margin: Margin.symmetric(horizontal: 64.px),
            radius: BorderRadius.circular(2.px),
            backgroundColor: AppColors.white,
          ),
        ]),
        css.media(MediaQuery.screen(maxWidth: 1000.px), [
          css('.inner_block', [
            css('&').styles(
              display: Display.flex,
              flexDirection: FlexDirection.column,
            ),
          ]),
        ]),
      ];
}
