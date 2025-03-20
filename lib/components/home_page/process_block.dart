import 'package:jaspr/jaspr.dart';
import 'package:my_website/components/home_page/card_process_block.dart';
import 'package:my_website/language/language_manager.dart';

class ProcessBlock extends StatelessComponent {
  const ProcessBlock({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable:
          LanguageManager.selectedLanguage, // Lắng nghe thay đổi ngôn ngữ
      builder: (context, lang) sync* {
        yield div(
          styles: Styles(
            display: Display.flex,
            margin: Margin.symmetric(horizontal: 100.px),
            flexDirection: FlexDirection.column,
            gap: Gap(row: 30.px),
          ),
          [
            CardProcessBlock(
              index: "01",
              title: LanguageManager.getTranslation(
                  'process_block', 'consultation_title'),
              content: LanguageManager.getTranslation(
                  'process_block', 'consultation_content'),
            ),
            CardProcessBlock(
              index: "02",
              title: LanguageManager.getTranslation(
                  'process_block', 'research_title'),
              content: LanguageManager.getTranslation(
                  'process_block', 'research_content'),
            ),
            CardProcessBlock(
              index: "03",
              title: LanguageManager.getTranslation(
                  'process_block', 'implementation_title'),
              content: LanguageManager.getTranslation(
                  'process_block', 'implementation_content'),
            ),
            CardProcessBlock(
              index: "04",
              title: LanguageManager.getTranslation(
                  'process_block', 'monitoring_title'),
              content: LanguageManager.getTranslation(
                  'process_block', 'monitoring_content'),
            ),
            CardProcessBlock(
              index: "05",
              title: LanguageManager.getTranslation(
                  'process_block', 'reporting_title'),
              content: LanguageManager.getTranslation(
                  'process_block', 'reporting_content'),
            ),
            CardProcessBlock(
              index: "06",
              title: LanguageManager.getTranslation(
                  'process_block', 'improvement_title'),
              content: LanguageManager.getTranslation(
                  'process_block', 'improvement_content'),
            ),
          ],
        );
      },
    );
  }
}
