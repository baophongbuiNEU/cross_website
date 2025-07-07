import 'package:jaspr/server.dart';

import 'app.dart';
import 'jaspr_options.dart';

void main() async {
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  runApp(Document(
    title: 'Cross Website',
    styles: [
      css.import(
          "https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&display=swap"),
      css.import('https://fonts.googleapis.com/css?family=Roboto'),
      css('html, body').styles(
        width: 100.percent,
        minHeight: 100.vh,
        padding: Padding.zero,
        margin: Margin.zero,
        fontFamily: const FontFamily.list(
            [FontFamily('Space Grotesk'), FontFamilies.andaleMono]),
      ),
      css('h1').styles(
        margin: Margin.unset,
        fontSize: 4.rem,
      ),
    ],
    head: [
      // The generated flutter manifest and bootstrap script.
      link(rel: 'manifest', href: 'manifest.json'),
      script(src: "flutter_bootstrap.js", async: true, []),
      link(href: 'images/x_cross.png', rel: 'icon', type: 'image/png'),
      script(
          src:
              "https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js",
          []),
      script(
          src:
              "https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs",
          attributes: {'type': 'module'},
          []),
    ],
    body: App(),
  ));
}
