import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr/jaspr.dart';

class MemberCard extends StatelessComponent {
  final String name;
  final String position;
  final String content;
  final String imagePath;

  const MemberCard({
    super.key,
    required this.name,
    required this.position,
    required this.imagePath,
    required this.content,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
        styles: Styles(
            padding: Padding.symmetric(horizontal: 35.px, vertical: 40.px),
            border: Border(color: AppColors.textBlack, width: 1.px),
            radius: BorderRadius.circular(45.px),
            shadow: BoxShadow(
                offsetX: 0.px, offsetY: 5.px, color: AppColors.textBlack),
            backgroundColor: AppColors.white),
        [_nameAndPosition(), _line(), _content()]);
  }

  Component _nameAndPosition() {
    return div(
        styles: Styles(
          display: Display.flex,
          flexDirection: FlexDirection.row,
        ),
        [
          div([img(src: imagePath, width: 100, height: 100)]),
          SizeBoxComponent(width: 20),
          div(
              styles: Styles(
                display: Display.flex,
                width: 100.percent,
                flexDirection: FlexDirection.column,
                justifyContent: JustifyContent.spaceBetween,
                alignItems: AlignItems.start,
              ),
              [
                div(
                    styles: Styles(
                      alignSelf: AlignSelf.end,
                    ),
                    [
                      _iconInstagram(),
                    ]),
                div(
                    styles: Styles(
                      width: 100.percent,
                    ),
                    [
                      div(
                          styles: Styles(
                            width: 100.percent,
                            color: AppColors.textBlack,
                            textAlign: TextAlign.start,
                            fontSize: 20.px,
                            fontWeight: FontWeight.w500,
                          ),
                          [Text(name)]),
                      div(
                          styles: Styles(
                              color: AppColors.textBlack,
                              textAlign: TextAlign.start,
                              fontSize: 18.px,
                              fontWeight: FontWeight.w400),
                          [Text(position)]),
                    ])
              ]),
        ]);
  }

  Component _iconInstagram() {
    return div(
        styles: Styles(
            display: Display.flex,
            width: 34.px,
            height: 34.px,
            radius: BorderRadius.circular(30.px),
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            color: AppColors.greenPrimary,
            fontSize: 20.px,
            fontWeight: FontWeight.bold,
            backgroundColor: AppColors.primaryColor),
        [Text("in")]);
  }

  Component _line() {
    return div(
        styles: Styles(
            height: 1.px,
            margin: Margin.symmetric(vertical: 28.px),
            backgroundColor: AppColors.textBlack),
        []);
  }

  Component _content() {
    return div(
        styles: Styles(
          color: AppColors.textBlack,
          textAlign: TextAlign.start,
          fontSize: 18.px,
          fontWeight: FontWeight.w400,
        ),
        [Text(content)]);
  }
}
