import 'dart:convert';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:universal_web/web.dart' as web;
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

enum SupportLanguage {
  en,
  vi,
  ja,
  ko,
}

class LanguageManager {
  static Map<String, Map<String, String>> translations = {};
  static Future<bool>? _loadFuture;
  static Map<String, dynamic> langAssets = {};
  static BuildContext? context;
  static const _languageKey = 'lang';

  static bool get isClient => kIsWeb;

  static String _getClientLanguage() {
    if (!isClient) return 'en';
    try {
      final browserLang = web.window.navigator.language.toLowerCase();
      if (browserLang.startsWith('vi')) return 'vi';
      if (browserLang.startsWith('ja')) return 'ja';
      if (browserLang.startsWith('ko')) return 'ko';
      return 'en';
    } catch (e) {
      return 'en';
    }
  }

  static void saveLanguage(String langCode) {
    if (!isClient) return;
    final expires = DateTime.now().add(Duration(days: 365)).toUtc();
    final cookie =
        '$_languageKey=$langCode; expires=${expires.toUtc().toIso8601String()}; path=/';
    web.document.cookie = cookie;
  }

  static String? getStoredLanguage() {
    if (!isClient) return null;
    final cookies = web.document.cookie.split(';');
    for (var cookie in cookies) {
      final parts = cookie.trim().split('=');
      if (parts[0] == _languageKey && parts.length > 1) {
        return parts[1];
      }
    }
    return null;
  }

  static final selectedLanguageProvider = StateProvider<String>((ref) {
    final storedLang = getStoredLanguage();
    if (storedLang != null && languages.containsKey(storedLang)) {
      return storedLang;
    }
    final clientLang = _getClientLanguage();
    return languages.containsKey(clientLang) ? clientLang : 'en';
  });

  static Future<Map<String, dynamic>> loadAsset(String assetsPath) async {
    throw UnimplementedError('Handle later');
    // print('--- Parse json from: $assetsPath');
    // return rootBundle
    //     .loadString(assetsPath)
    //     .then((jsonStr) => jsonDecode(jsonStr));
  }

  // static final ValueNotifier<String> selectedLanguage = ValueNotifier('en');

  static final languages = {
    'en': 'English',
    'vi': 'Tiếng Việt',
    'ko': '한국어',
    'ja': '日本語',
  };

  static const csvUrl =
      'https://docs.google.com/spreadsheets/d/1DJ2ViLI_pEUuDvSK80m5VY-Ksdhx47NsVokixHmKRtY/export?format=csv&gid=0';
  static Future<bool> loadTranslations() {
    if (_loadFuture != null) {
      return _loadFuture!;
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
      return true;
    } catch (e) {
      return false;
    }
  }

  static String translate(String key, [String? langCode]) {
    final language = langCode ?? 'en';
    return translations[key]?[language] ?? 'Translation not found';
  }

  static String tr(String key, String langCode) {
    return translations[key]?[langCode] ?? 'unknown';
  }
}
