import 'package:jaspr/jaspr.dart';
import 'package:my_website/components/common/size_box_component.dart';
import 'package:my_website/constants/app_colors.dart';
import 'package:my_website/constants/image_constant.dart';

class CaseStudiesBlock extends StatelessComponent {
  const CaseStudiesBlock({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'case_studies_block', [
      div(classes: 'inner_block', [
        _item(
            content:
                "For a local restaurant, we implemented a targeted PPC campaign that resulted in a 50% increase in website traffic and a 25% increase in sales."),
        _line(),
        _item(
            content:
                'For a B2B software company, we developed an SEO strategy that resulted in a first page ranking for key keywords and a 200% increase in organic traffic.'),
        _line(),
        _item(
            content:
                'For a national retail chain, we created a social media marketing campaign that increased followers by 25% and generated a 20% increase in online sales.')
      ])
    ]);
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
                  fontWeight: FontWeight.w400),
              [Text(content)]),
          SizeBoxComponent(height: 20),
          div(
              styles: Styles(
                  display: Display.flex, flexDirection: FlexDirection.row),
              [
                div(
                    styles: Styles(
                        color: AppColors.greenPrimary,
                        fontSize: 20.px,
                        fontWeight: FontWeight.w400),
                    [
                      Text("Learn more"),
                    ]),
                SizeBoxComponent(width: 15),
                img(src: Images.learnMoreGreenIcon, width: 18, height: 18),
              ]),
          SizeBoxComponent(height: 20),
        ]);
  }

  Component _line() {
    return div(classes: 'line', []);
  }

  @css
  static final style = [
    css('.case_studies_block', [
      css('&').styles(
        width: 100.vw,
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
      )
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
