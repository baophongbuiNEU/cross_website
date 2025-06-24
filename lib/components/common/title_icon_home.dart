import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr/jaspr.dart';
import 'package:cross_website/components/header.dart';

class TitleIconHome extends StatelessComponent {
  final String title;
  final String? content;

  const TitleIconHome({super.key, this.content, required this.title});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'section_overall', [
      div(classes: 'section_title', [
        h1(classes: 'title_section', [text(title)]),
        SizeBoxComponent(width: 40),
        div(classes: 'section_content', [text(content ?? "")])
      ])
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.section_overall', [
          css('&').styles(
              maxWidth: 100.percent,
              justifyContent: JustifyContent.center,
              alignItems: AlignItems.center,
              alignSelf: AlignSelf.center)
        ]),
        css('.section_title', [
          css('&').styles(
            display: Display.flex,
            padding: Padding.symmetric(vertical: 80.px, horizontal: 100.px),
            flexDirection: FlexDirection.row,
            alignItems: AlignItems.center,
          ),
        ]),
        css('.section_content', [
          css('&').styles(
            width: 80.vw,
            flex: Flex.auto,
            color: AppColors.textBlack,
            fontFamily: FontFamily.list(
                [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
          )
        ]),
        css('.title_section').styles(
          padding: Padding.symmetric(horizontal: 10.px),
          radius: BorderRadius.circular(8.px),
          color: AppColors.primaryColor,
          fontFamily: FontFamily.list(
              [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
          fontSize: 40.px,
          fontWeight: FontWeight.w500,
          whiteSpace: WhiteSpace.noWrap,
          backgroundColor: AppColors.greenPrimary,
        ),
        css.media(
            MediaQuery.screen(maxWidth: HeaderState.mobileBreakpoint.px), [
          css('.section_overall', [
            css('&').styles(
              padding: Padding.symmetric(horizontal: 0.px),
            )
          ]),
          css('.section_title').styles(
            display: Display.flex,
            padding: Padding.symmetric(vertical: 80.px, horizontal: 5.percent),
            flexDirection: FlexDirection.column,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
          ),
          css('.section_content').styles(
            margin: Margin.only(top: 20.px),
            textAlign: TextAlign.center,
          ),
          css('.title_section').styles(
            textAlign: TextAlign.center,
            whiteSpace: WhiteSpace.unset,
          ),
        ]),
      ];
}
