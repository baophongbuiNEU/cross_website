import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

extension StringExtension on String {
  String translate(BuildContext context) {
    return LanguageManager.tr(this, context.watch(langProvider));
  }
}

extension ContextExtension on BuildContext {
  String translate(String key) {
    return LanguageManager.tr(key, watch(langProvider));
  }
}
