import 'package:cross_website/components/common/dotlottie_player.dart';
import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr/jaspr.dart';

class LoadingScreen extends StatelessComponent {
  const LoadingScreen({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'loading-container', [
      div(classes: 'loading-spinner', [
        DotLottiePlayer(
          src:
              'https://lottie.host/5ab9acca-7662-4dcf-8ac8-dc4670cb16dd/aE8Z02PyVA.lottie',
          background: 'transparent',
          speed: 1.0,
          width: 100,
          height: 100,
          loop: true,
          autoplay: true,
        ),
        SizeBoxComponent(height: 30),
        p(
          styles: Styles(
            color: AppColors.textBlack,
            fontSize: 16.px,
            fontWeight: FontWeight.w500,
          ),
          [text('Loading...')],
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.loading-container', [
          css('&').styles(
            display: Display.flex,
            height: 100.vh,
            width: 100.vw,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            backgroundColor: AppColors.backgroundTheme,
          ),
        ]),
        css('.loading-spinner', [
          css('&').styles(
            display: Display.flex,
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.center,
            justifyContent: JustifyContent.center,
            textAlign: TextAlign.center,
          ),
        ]),
      ];
}
