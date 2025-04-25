import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

extension StringExtension on String {
  String translate(BuildContext context) {
    return LanguageManager.translate(
        this, context.watch(selectedLanguageProvider));
  }
}

extension ContextExtension on BuildContext {
  String translate(String key) {
    return LanguageManager.translate(key, watch(selectedLanguageProvider));
  }
}
