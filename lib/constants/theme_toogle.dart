import 'package:jaspr/jaspr.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:universal_web/web.dart' as web;

class ThemeToggle extends StatefulComponent {
  const ThemeToggle({super.key});

  @override
  State createState() => ThemeToggleState();
}

class ThemeToggleState extends State<ThemeToggle> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) return;

    // Đọc trực tiếp từ cookie
    String? activeTheme = web.document.cookie
        .split('; ')
        .firstWhere((cookie) => cookie.startsWith('active-theme='),
            orElse: () => '')
        .replaceFirst('active-theme=', '');

    if (activeTheme.isNotEmpty) {
      isDark = activeTheme == 'dark';
    } else {
      isDark = web.window.matchMedia('(prefers-color-scheme: dark)').matches;
    }

    // Đồng bộ class của documentElement
    web.document.documentElement!.className = isDark ? 'dark' : 'light';
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (kIsWeb) {
      yield Document.html(attributes: {'class': isDark ? 'dark' : 'light'});
    }

    yield button(
      classes: 'theme-toggle',
      attributes: {'aria-label': 'Theme Toggle'},
      onClick: () {
        setState(() {
          isDark = !isDark;
        });
        web.document.cookie =
            'active-theme=${isDark ? 'dark' : 'light'}; path=/; max-age=${365 * 24 * 60 * 60}';
        web.document.documentElement!.className = isDark ? 'dark' : 'light';
      },
      styles: !kIsWeb
          ? Styles(visibility: Visibility.hidden)
          : Styles(fontSize: 30.px),
      [text(isDark ? '🌙' : '☀️')],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.theme-toggle', [
      css('&').styles(
        display: Display.flex,
        padding: Padding.all(.7.rem),
        border: Border.unset,
        radius: BorderRadius.circular(8.px),
        outline: Outline.unset,
        alignItems: AlignItems.center,
        color: AppColors.textBlack,
        backgroundColor: Colors.transparent,
      ),
      css('&:hover').styles(
        backgroundColor: AppColors.hoverOverlayColor,
      ),
    ]),
  ];
}
