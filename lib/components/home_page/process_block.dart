import 'package:cross_website/components/home_page/card_process_block.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';

class ProcessBlock extends StatelessComponent {
  const ProcessBlock({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable: LanguageManager.selectedLanguage,
      builder: (context, lang) sync* {
        yield div(
        styles: Styles(
          width: 100.vw,
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          alignSelf: AlignSelf.center,
        ),
        [
          div(
              styles: Styles(
                display: Display.flex,
                width: 100.percent,
                flexDirection: FlexDirection.column,
                gap: Gap(row: 30.px),
              ),
          [
            CardProcessBlock(
              index: "01",
              title: LanguageManager.translate('process_consultation_title'),
              content:
                  LanguageManager.translate('process_consultation_content'),
            ),
            CardProcessBlock(
              index: "02",
              title: LanguageManager.translate('process_research_title'),
              content: LanguageManager.translate('process_research_content'),
            ),
            CardProcessBlock(
              index: "03",
              title: LanguageManager.translate('process_implementation_title'),
              content:
                  LanguageManager.translate('process_implementation_content'),
            ),
            CardProcessBlock(
              index: "04",
              title: LanguageManager.translate('process_monitoring_title'),
              content: LanguageManager.translate('process_monitoring_content'),
            ),
            CardProcessBlock(
              index: "05",
              title: LanguageManager.translate('process_reporting_title'),
              content: LanguageManager.translate('process_reporting_content'),
            ),
            CardProcessBlock(
              index: "06",
              title: LanguageManager.translate('process_improvement_title'),
              content: LanguageManager.translate('process_improvement_content'),
            ),
          ]),
        ]);
      },
    );
  }
}
