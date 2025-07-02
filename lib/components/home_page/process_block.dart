import 'dart:developer';

import 'package:cross_website/components/home_page/card_process_block.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class ProcessBlock extends StatelessComponent {
  const ProcessBlock({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    log('the deo nao');
    final selectedLang =
        context.watch(LanguageManager.selectedLanguageProvider);

    yield div(
      styles: Styles(
        maxWidth: 100.percent,
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
              title: LanguageManager.translate(
                  'process_consultation_title', selectedLang),
              content: LanguageManager.translate(
                  'process_consultation_content', selectedLang),
            ),
            CardProcessBlock(
              index: "02",
              title: LanguageManager.translate(
                  'process_research_title', selectedLang),
              content: LanguageManager.translate(
                  'process_research_content', selectedLang),
            ),
            CardProcessBlock(
              index: "03",
              title: LanguageManager.translate(
                  'process_implementation_title', selectedLang),
              content: LanguageManager.translate(
                  'process_implementation_content', selectedLang),
            ),
            CardProcessBlock(
              index: "04",
              title: LanguageManager.translate(
                  'process_monitoring_title', selectedLang),
              content: LanguageManager.translate(
                  'process_monitoring_content', selectedLang),
            ),
            CardProcessBlock(
              index: "05",
              title: LanguageManager.translate(
                  'process_reporting_title', selectedLang),
              content: LanguageManager.translate(
                  'process_reporting_content', selectedLang),
            ),
            CardProcessBlock(
              index: "06",
              title: LanguageManager.translate(
                  'process_improvement_title', selectedLang),
              content: LanguageManager.translate(
                  'process_improvement_content', selectedLang),
            ),
            CardProcessBlock(
              index: "07",
              title: LanguageManager.translate('step7_label', selectedLang),
              content: LanguageManager.translate('step7_content', selectedLang),
            ),
            CardProcessBlock(
              index: "08",
              title: LanguageManager.translate('step8_label', selectedLang),
              content: LanguageManager.translate('step8_content', selectedLang),
            ),
          ],
        ),
      ],
    );
  }
}
