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
    yield button(
        onClick: () => setState(
              () => _isShowMoore = !_isShowMoore,
            ),
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
                width: 100.percent,
                justifyContent: JustifyContent.spaceBetween,
                alignItems: AlignItems.center,
              ),
              [
                div(classes: 'card_process_index', [
                  Text(component.index),
                ]),
                div(classes: 'card_process_title', [
                  Text(component.title),
                ]),
                _iconShowMore(),
              ]),
          if (_isShowMoore)
            div(classes: 'process_content', [
              _line(),
              div(
                  styles: Styles(
                      color: AppColors.primaryColor,
                      fontSize: 18.px,
                      fontWeight: FontWeight.w400),
                  [
                    // TODO(anyone): make content lign left
                    Text(component.content),
                  ])
            ])
        ]);
  }

  Component _iconShowMore() {
    return div(classes: 'icon-show-more', [text(_isShowMoore ? "-" : "+")]);
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
  static List<StyleRule> get style => [
// số thứ tự
        css('.card_process_index').styles(
          flex: Flex(shrink: 0),
          color: AppColors.primaryColor,
          fontSize: 60.px,
          fontWeight: FontWeight.w600,
        ),

// tiêu đề
        css('.card_process_title').styles(
          flex: Flex(grow: 1),
          color: AppColors.primaryColor,
          fontSize: 30.px,
          fontWeight: FontWeight.w600, // chiếm phần còn lại
        ),

// nút “+”
        css('.icon-show-more').styles(
          display: Display.flex,
          width: 58.px,
          height: 58.px,
          margin: Spacing.only(left: Unit.auto),
          radius: BorderRadius.circular(50.px),
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          flex: Flex(shrink: 0),
          color: AppColors.primaryColor,
          fontSize: 36.px,
          fontWeight: FontWeight.w600,
          backgroundColor: Colors.white,
        ),

        css.media(MediaQuery.screen(maxWidth: 1000.px), [
          css('.card_process_title', [
            css('&').styles(
              width: 80.percent,
              justifyContent: JustifyContent.center,
              textAlign: TextAlign.center,
              fontSize: 20.px,
            ),
          ]),
          css('.card_process_index').styles(
            // width: 10.percent,
            fontSize: 40.px,
          ),
          css('.icon-show-more').styles(
            width: 48.px,
            height: 48.px,
            fontSize: 30.px,
          ),
        ]),
      ];
}
