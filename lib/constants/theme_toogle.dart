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

    isDark = web.document.documentElement!.className == 'dark';
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (!kIsWeb) {
      yield Document.head(children: [
        // ignore: prefer_html_methods
        DomComponent(id: 'theme-script', tag: 'script', children: [
          raw('''
  (function() {
    // Function to get cookie by name
    function getCookie(name) {
      let match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
      return match ? match[2] : null;
    }
    
    // Function to set cookie
    function setCookie(name, value, days) {
      let expires = "";
      if (days) {
        let date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
      }
      document.cookie = name + "=" + value + expires + "; path=/";
    }
    
    // Load the saved theme from cookies or use system preference
    let userTheme = getCookie('active-theme');

    if (userTheme) {
      document.documentElement.className = userTheme; // Apply stored theme
    } else if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
      document.documentElement.className = 'dark'; // Use system dark mode
    } else {
      document.documentElement.className = 'light'; // Default to light mode
    }

    // Function to toggle theme and save to cookies
    window.toggleTheme = function() {
      let currentTheme = document.documentElement.classList.contains('dark') ? 'light' : 'dark';
      document.documentElement.className = currentTheme;
      setCookie('active-theme', currentTheme, 365); // Save for 1 year
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
        setState(() {
          isDark = !isDark;
        });
        web.document.cookie =
            'active-theme=${isDark ? 'dark' : 'light'}; path=/; max-age=${365 * 24 * 60 * 60}';
      },
      styles: !kIsWeb
          ? Styles(visibility: Visibility.hidden)
          : Styles(fontSize: 30.px),
      // styles: Styles(fontSize: 30.px),
      [img(src: isDark ? 'images/moon.svg' : 'images/sun.svg')],
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
