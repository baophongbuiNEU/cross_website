import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'jaspr_options.dart';

void main() async {
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  runApp(Document(
    title: 'my_website',
    styles: [
      css.import(
          "https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&display=swap"),
      css.import('https://fonts.googleapis.com/css?family=Roboto'),
      css('html, body').styles(
        width: 100.percent,
        minHeight: 100.vh,
        maxWidth: 100.vw,
        padding: Padding.zero,
        margin: Margin.zero,
        boxSizing: BoxSizing.borderBox,
        fontFamily: const FontFamily.list(
            [FontFamily('Space Grotesk'), FontFamilies.sansSerif]),
        backgroundColor: AppColors.backgroundTheme,
      ),
      css('h1').styles(
        margin: Margin.unset,
        fontSize: 4.rem,
      ),
      css('text').styles(
        color: Colors.black,
      ),
    ],
    head: [
      // The generated flutter manifest and bootstrap script.
      link(rel: 'manifest', href: 'manifest.json'),
      script(src: "flutter_bootstrap.js", async: true, []),
      link(href: 'images/x_cross.png', rel: 'icon', type: 'image/png'),
    ],
    body: App(),
  ));
}
