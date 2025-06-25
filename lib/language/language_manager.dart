import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:universal_web/web.dart' as web;

enum SupportLanguage {
  en,
  vi,
  ja,
  ko,
}

class LanguageManager {
  static Map<String, Map<String, String>> translations = {};
  static Future<bool>? _loadFuture;
  static const _languageKey = 'lang';
  static const _cacheKey = 'translations_cache';
  static const _cacheTimestampKey = 'translations_cache_timestamp';
  static const _cacheDuration = Duration(hours: 24);
  static Map<String, dynamic> langAssets = {};
  static bool _hasCookieConsent = getCookieConsent();
  static bool get hasCookieConsent => _hasCookieConsent;

  static final cookieConsentProvider = StateProvider<bool?>((ref) {
    if (!isClient) return null;
    final cookies = web.document.cookie.split(';');
    for (var cookie in cookies) {
      final parts = cookie.trim().split('=');
      if (parts[0] == 'cookie_consent' && parts.length > 1) {
        return parts[1] == 'true' ? true : false;
      }
    }
    return null;
  });

  static const csvUrl =
      'https://docs.google.com/spreadsheets/d/1DJ2ViLI_pEUuDvSK80m5VY-Ksdhx47NsVokixHmKRtY/export?format=csv&gid=0';

  static bool get isClient => kIsWeb;

  static Future<Map<String, dynamic>> loadAsset(String assetsPath) async {
    throw UnimplementedError('Handle later');
  }

  static String _getClientLanguage() {
    if (!isClient) return 'en';
    try {
      final browserLang = web.window.navigator.language.toLowerCase();
      if (browserLang.startsWith('vi')) return 'vi';
      if (browserLang.startsWith('ja')) return 'ja';
      if (browserLang.startsWith('ko')) return 'ko';
      return 'en';
    } catch (e) {
      print('Error detecting client language: $e');
      return 'en';
    }
  }

  static void saveLanguage(String langCode, BuildContext context) {
    if (!isClient || !_hasCookieConsent) {
      print('Skipping saveLanguage due to no cookie consent');
      return;
    }
    try {
      final expires = DateTime.now().add(Duration(days: 365)).toUtc();
      final cookie =
          '$_languageKey=$langCode; expires=${expires.toIso8601String()}; path=/';
      web.document.cookie = cookie;
    } catch (e) {
      print('Error saving language to cookie: $e');
    }
  }

  static String? getStoredLanguage() {
    if (!isClient || !_hasCookieConsent) {
      print('No cookie consent or not client, skipping cookie read');
      return null;
    }
    try {
      final cookies = web.document.cookie.split(';');
      for (var cookie in cookies) {
        final parts = cookie.trim().split('=');
        if (parts[0] == _languageKey && parts.length > 1) {
          return parts[1];
        }
      }
    } catch (e) {
      print('Error reading language from cookie: $e');
    }
    return null;
  }

  static void setCookieConsent(bool consent, BuildContext context) {
    print('setCookieConsent called with consent: $consent');
    _hasCookieConsent = consent;
    context.read(cookieConsentProvider.notifier).state = consent;

    if (isClient) {
      try {
        final expires = DateTime.now().add(Duration(days: 365)).toUtc();
        final consentCookie =
            'cookie_consent=$consent; expires=${expires.toIso8601String()}; path=/';
        web.document.cookie = consentCookie;

        if (!consent) {
          print('Clearing language cookie due to Decline');
          web.document.cookie =
              '$_languageKey=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/';
          context.read(selectedLanguageProvider.notifier).state = 'en';
        } else {
          final langCode = _getClientLanguage();
          saveLanguage(langCode, context);
          context.read(selectedLanguageProvider.notifier).state = langCode;
        }
      } catch (e) {
        print('Error saving cookie consent or language: $e');
      }
    } else {
      final langCode = consent ? _getClientLanguage() : 'en';
      context.read(selectedLanguageProvider.notifier).state = langCode;
    }
  }

  static bool getCookieConsent() {
    if (!isClient) return false;
    try {
      final cookies = web.document.cookie.split(';');
      for (var cookie in cookies) {
        final parts = cookie.trim().split('=');
        if (parts[0] == 'cookie_consent' && parts.length > 1) {
          return parts[1] == 'true';
        }
      }
    } catch (e) {
      print('Error reading cookie consent: $e');
    }
    return false;
  }

  static final selectedLanguageProvider = StateProvider<String>((ref) {
    final hasConsent = ref.watch(cookieConsentProvider);
    if (hasConsent == null) {
      print('No cookie consent decision, defaulting to English');
      return 'en';
    }
    if (!hasConsent) {
      print('Cookie consent declined, defaulting to English');
      return 'en';
    }
    final storedLang = getStoredLanguage();
    if (storedLang != null && languages.containsKey(storedLang)) {
      print('Using stored language: $storedLang');
      return storedLang;
    }
    final clientLang = _getClientLanguage();
    print('Using client language: $clientLang');
    return languages.containsKey(clientLang) ? clientLang : 'en';
  });

  static final languages = {
    'en': 'English',
    'vi': 'Tiếng Việt',
    'ko': '한국어',
    'ja': '日本語',
  };

  static Future<bool> loadTranslations({bool forceRefresh = false}) async {
    if (_loadFuture != null && !forceRefresh) {
      return _loadFuture!;
    }

    if (!forceRefresh && isClient) {
      final cachedTranslations = _getCachedTranslations();
      if (cachedTranslations != null && !_isCacheExpired()) {
        translations = cachedTranslations;
        return Future.value(true);
      }
    }

    _loadFuture = _loadTranslationsImpl();
    try {
      final result = await _loadFuture!;
      _loadFuture = null;
      return result;
    } catch (e) {
      _loadFuture = null;
      print('Error in loadTranslations: $e');
      return false;
    }
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
        final cachedTranslations = _getCachedTranslations();
        if (cachedTranslations != null) {
          print('Using cached translations as fallback (empty CSV)');
          translations = cachedTranslations;
          return true;
        }
        print('No translations available: CSV is empty and no cache found');
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

      if (isClient) {
        _saveToCache(translations);
      }
      return true;
    } catch (e) {
      final cachedTranslations = _getCachedTranslations();
      if (cachedTranslations != null) {
        print('Using cached translations as fallback (error: $e)');
        translations = cachedTranslations;
        return true;
      }
      print('Error loading translations: $e');
      return false;
    }
  }

  static Map<String, Map<String, String>>? _getCachedTranslations() {
    if (!isClient || !_hasCookieConsent) {
      print('No cookie consent or not client, skipping cache read');
      return null;
    }
    try {
      final cachedData = web.window.localStorage[_cacheKey];
      if (cachedData != null) {
        final decoded = jsonDecode(cachedData) as Map<String, dynamic>;
        return decoded.map((key, value) => MapEntry(
              key,
              (value as Map)
                  .map((k, v) => MapEntry(k.toString(), v.toString())),
            ));
      }
    } catch (e) {
      print('Error reading cache: $e');
    }
    return null;
  }

  static void _saveToCache(Map<String, Map<String, String>> translations) {
    if (!isClient) return;
    try {
      web.window.localStorage[_cacheKey] = jsonEncode(translations);
      web.window.localStorage[_cacheTimestampKey] =
          DateTime.now().toIso8601String();
    } catch (e) {
      print('Error saving to cache: $e');
    }
  }

  static bool _isCacheExpired() {
    if (!isClient) return true;
    try {
      final timestampStr = web.window.localStorage[_cacheTimestampKey];
      if (timestampStr == null) return true;
      final timestamp = DateTime.parse(timestampStr);
      return DateTime.now().difference(timestamp) > _cacheDuration;
    } catch (e) {
      print('Error checking cache expiration: $e');
      return true;
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
