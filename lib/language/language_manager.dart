import 'dart:convert';
import 'package:cross_website/constants/app_colors.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:jaspr/jaspr.dart';

class LanguageManager {
  static final ValueNotifier<String> selectedLanguage = ValueNotifier('en');
  static Map<String, Map<String, String>> translations = {};
  static Future<bool>? _loadFuture; // Lưu trữ Future

  static final languages = {
    'en': 'English',
    'vi': 'Tiếng Việt',
    'ko': '한국어',
    'ja': '日本語',
  };

  /// 🔥 Thêm URL Google Sheets CSV xuất từ `Publish to web`
  static const csvUrl =
      'https://docs.google.com/spreadsheets/d/e/2PACX-1vSNlKQeqLejlMES-fomkTkma_oOsy6reRRmUz7TvRmYrMA0Gt9QdQmbm4zg1ohJHh777kKZTIv2hF2p/pub?output=csv';
  static Future<bool> loadTranslations() {
    if (_loadFuture != null) {
      return _loadFuture!; // Trả về Future đã lưu
    }
    _loadFuture = _loadTranslationsImpl();
    return _loadFuture!;
  }

  static Future<bool> _loadTranslationsImpl() async {
    try {
      final response = await http.get(Uri.parse(csvUrl));
      if (response.statusCode != 200) {
        throw Exception('Failed to load CSV: ${response.statusCode}');
      }

      final utf8Body = utf8.decode(response.bodyBytes);
      final rows = const CsvToListConverter().convert(utf8Body);

      if (rows.isEmpty) {
        print('CSV is empty');
        return false;
      }

      final headers = rows.first.cast<String>();
      translations.clear();

      for (var i = 1; i < rows.length; i++) {
        final row = rows[i];
        final key = row[0].toString();

        for (var j = 1; j < headers.length; j++) {
          final langCode = headers[j].toString().toLowerCase();
          final value = j < row.length ? row[j].toString() : '';
          translations.putIfAbsent(key, () => {})[langCode] = value;
        }
      }

      print('✅ Loaded translations: ${translations.length} keys');
      print('Translations: $translations');
      return true;
    } catch (e) {
      print('❌ Error loading translations: $e');
      return false;
    }
  }

  static String translate(String key) {
    return translations[key]?[selectedLanguage.value] ?? key;
  }

  static Component languageDropdown() {
    return div(classes: "language-header", [
      select(
        styles: Styles(
          color: AppColors.textBlack,
          backgroundColor: Colors.transparent,
        ),
        events: {
          'change': (dynamic event) {
            final value = event.target.value as String?;
            if (value != null) {
              selectedLanguage.value = value;
            }
          }
        },
        [
          for (var lang in languages.entries)
            option(
              styles: Styles(
                  color: AppColors.textBlack,
                  backgroundColor: AppColors.backgroundTheme),
              attributes: {
                'value': lang.key,
                if (lang.key == selectedLanguage.value) 'selected': ''
              },
              [text(lang.value)],
            ),
        ],
      ),
    ]);
  }

  @css
  static final styles = [
    css('.language-header', [
      css('&').styles(
        display: Display.flex,
        height: 48.px,
        padding: Padding.symmetric(horizontal: 15.px),
        border: Border(color: AppColors.textBlack, width: 1.px),
        radius: BorderRadius.circular(14.px),
        alignItems: AlignItems.center,
      ),
      css('select').styles(
        border: Border.none,
        cursor: Cursor.pointer,
        color: AppColors.textBlack,
        textAlign: TextAlign.center,
        fontFamily: FontFamily.list(
            [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
        fontSize: 18.px,
        fontWeight: FontWeight.w400,
        backgroundColor: Colors.transparent,
        raw: {'-webkit-appearance': 'none', '-moz-appearance': 'none'},
      ),
    ]),
  ];
}
