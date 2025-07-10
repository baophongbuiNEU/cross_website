import 'package:jaspr/jaspr.dart';
import 'package:cross_website/constants/image_constant.dart';

class ListLogo extends StatelessComponent {
  const ListLogo({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'list-logo-container', [
      div(classes: 'list-logo-content', [
        a(href: 'https://ited.edu.vn/', target: Target.blank, [
          img(src: Images.itedLogo),
        ]),
        a(href: 'https://vfastsoft.com/', target: Target.blank, [
          img(src: Images.vfastLogo),
        ]),
        img(src: Images.laiXeVanXuanLogo),
      ])
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.list-logo-container').styles(
          display: Display.flex,
          maxWidth: 100.percent,
          padding: Padding.symmetric(vertical: 20.px),
          flexDirection: FlexDirection.row,
          flexWrap: FlexWrap.wrap,
          gap: Gap.all(0.4.rem),
        ),
        css('.list-logo-content').styles(
            display: Display.flex,
            width: 100.percent,
            padding: Padding.symmetric(horizontal: 100.px),
            flexDirection: FlexDirection.row,
            flexWrap: FlexWrap.wrap,
            justifyContent: JustifyContent.spaceEvenly),
        css('.list-logo-content img').styles(
          // maxWidth: 120.px,
          // maxHeight: 100.percent,
          height: 80.px,
        ),
        css.media(MediaQuery.screen(maxWidth: 600.px), [
          css('.list-logo-content').styles(
            padding: Padding.symmetric(horizontal: 10.px),
          ),
        ]),
      ];
}
