import 'package:jaspr/jaspr.dart';
import 'package:my_website/components/common/size_box_component.dart';
import 'package:my_website/constants/app_colors.dart';

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
            // width: 100.vw,
            padding: Padding.symmetric(horizontal: 5.percent, vertical: 40.px),
            margin: Spacing.symmetric(horizontal: 5.percent),
            border: Border(color: AppColors.primaryColor, width: 1.px),
            radius: BorderRadius.circular(45.px),
            shadow: BoxShadow(
                offsetX: 0.px, offsetY: 5.px, color: AppColors.primaryColor),
            flexDirection: FlexDirection.column,
            backgroundColor:
                _isShowMoore ? AppColors.greenPrimary : Colors.white),
        [
          div(
              styles: Styles(
                  display: Display.flex,
                  flexDirection: FlexDirection.row,
                  // justifyContent: JustifyContent.spaceBetween,
                  alignItems: AlignItems.center),
              [
                div(
                    styles: Styles(
                        width: 10.percent,
                        color: AppColors.primaryColor,
                        fontSize: 60.px,
                        fontWeight: FontWeight.w600),
                    [
                      Text(component.index),
                    ]),
                SizeBoxComponent(width: 25),
                div(classes: 'card_process_title', [
                  Text(component.title),
                ]),
                div(styles: Styles(width: 10.percent), [
                  _iconShowMore(),
                ]),
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
          backgroundColor: Colors.white,
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

  @css
  static final style = [
    css('.card_process_title', [
      css('&').styles(
          display: Display.flex,
          width: 100.percent,
          color: AppColors.primaryColor,
          fontSize: 30.px,
          fontWeight: FontWeight.w600),
    ]),
    css.media(MediaQuery.screen(maxWidth: 1000.px), [
      css('.card_process_title', [
        css('&').styles(
          width: 80.percent,
          justifyContent: JustifyContent.center,
          textAlign: TextAlign.center,
        ),
      ]),
    ]),
  ];
}
