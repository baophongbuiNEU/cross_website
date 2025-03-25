import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr/jaspr.dart';

class CardProcessBlock extends StatefulComponent {
  final String index;
  final String title;
  final String content;

  const CardProcessBlock({
    super.key,
    required this.index,
    required this.title,
    required this.content,
  });

  @override
  State<CardProcessBlock> createState() => CardProcessBlockState();
}

class CardProcessBlockState extends State<CardProcessBlock> {
  bool _isShowMoore = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
        styles: Styles(
            display: Display.flex,
            padding: Padding.symmetric(horizontal: 60.px, vertical: 40.px),
            border: Border(color: AppColors.primaryColor, width: 1.px),
            radius: BorderRadius.circular(45.px),
            shadow: BoxShadow(
                offsetX: 0.px, offsetY: 5.px, color: AppColors.primaryColor),
            flexDirection: FlexDirection.column,
            backgroundColor: _isShowMoore
                ? AppColors.greenPrimary
                : AppColors.backgroundWhite),
        [
          div(
              styles: Styles(
                  display: Display.flex,
                  flexDirection: FlexDirection.row,
                  justifyContent: JustifyContent.spaceBetween,
                  alignItems: AlignItems.center),
              [
                div(
                    styles: Styles(
                        display: Display.flex,
                        flexDirection: FlexDirection.row,
                        alignItems: AlignItems.center),
                    [
                      div(
                          styles: Styles(
                              color: AppColors.primaryColor,
                              fontSize: 60.px,
                              fontWeight: FontWeight.w600),
                          [
                            Text(component.index),
                          ]),
                      SizeBoxComponent(width: 25),
                      div(
                          styles: Styles(
                              color: AppColors.primaryColor,
                              fontSize: 30.px,
                              fontWeight: FontWeight.w600),
                          [
                            Text(component.title),
                          ]),
                    ]),
                _iconShowMore(),
              ]),
          if (_isShowMoore)
            div([
              _line(),
              div(
                  styles: Styles(
                      color: AppColors.primaryColor,
                      fontSize: 18.px,
                      fontWeight: FontWeight.w400),
                  [
                    Text(component.content),
                  ])
            ])
        ]);
  }

  Component _iconShowMore() {
    return button(
        onClick: () => setState(
              () => _isShowMoore = !_isShowMoore,
            ),
        styles: Styles(
          width: 58.px,
          height: 58.px,
          radius: BorderRadius.circular(50.px),
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          color: AppColors.primaryColor,
          fontSize: 36.px,
          fontWeight: FontWeight.w600,
          backgroundColor: AppColors.backgroundWhite,
        ),
        [Text(_isShowMoore ? "-" : "+")]);
  }

  Component _line() {
    return div(
        styles: Styles(
            height: 1.px,
            margin: Margin.symmetric(vertical: 30.px),
            backgroundColor: AppColors.primaryColor),
      [

    ]);
  }
}
