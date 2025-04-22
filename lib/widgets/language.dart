import 'package:jaspr/jaspr.dart';

class LanguageProvider extends InheritedComponent {
  final String language;
  final void Function(String) setLanguage;

  const LanguageProvider(
      {required this.language,
      required this.setLanguage,
      required super.child});

  static LanguageProvider of(BuildContext context) {
    return context.dependOnInheritedComponentOfExactType<LanguageProvider>()!;
  }

  @override
  bool updateShouldNotify(LanguageProvider old) => language != old.language;
}
