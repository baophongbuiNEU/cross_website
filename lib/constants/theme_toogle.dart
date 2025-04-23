import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:universal_web/web.dart' as web;

final themeProvider = StateProvider<bool>((ref) {
  final time = DateTime.now();
  // web.document.documentElement?.className == 'dark'
  return time.hour >= 18 || time.hour < 6;
});

class ThemeToggle extends StatelessComponent {
  const ThemeToggle({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final isDark = context.watch(themeProvider);

    if (!kIsWeb) {
      yield Document.head(children: [
        // ignore: prefer_html_methods
        DomComponent(id: 'theme-script', tag: 'script', children: [
          raw('''
  (function() {
    // Load the saved theme or use system preference
    let userTheme = window.localStorage.getItem('active-theme');

    if (userTheme) {
      document.documentElement.className = userTheme; // Apply stored theme
    } else if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
      document.documentElement.className = 'dark'; // Use system dark mode
    } else {
      document.documentElement.className = 'light'; // Default to light mode
    }

    // Function to toggle theme and save to localStorage
    window.toggleTheme = function() {
      let currentTheme = document.documentElement.classList.contains('dark') ? 'light' : 'dark';
      document.documentElement.className = currentTheme;
      window.localStorage.setItem('active-theme', currentTheme);
    };
  })();
  ''')
        ]),
      ]);
    }

    if (kIsWeb) {
      yield Document.html(attributes: {'class': isDark ? 'dark' : 'light'});
    }

    yield button(
      classes: 'theme-toggle',
      attributes: {'aria-label': 'Theme Toggle'},
      onClick: () {
        context.read(themeProvider.notifier).state = !isDark;

        web.window.localStorage
            .setItem('active-theme', isDark ? 'dark' : 'light');
      },
      styles: Styles(fontSize: 30.px),
      // styles: Styles(fontSize: 30.px),
      [text(isDark ? '🌙' : '☀️')],
    );
  }

  @css
  static final List<StyleRule> styles = [
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
