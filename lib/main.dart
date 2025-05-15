import 'package:jaspr/server.dart';
import 'app.dart';
import 'jaspr_options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  // Add the loading overlay script to the document head
  runApp(Document(
    title: 'cross_website',
    head: [
      // Loading overlay script - hides content until language is ready
      if (kIsWeb) script(id: 'loading-script', src: '''
          (function() {
            // Create loading overlay
            document.addEventListener('DOMContentLoaded', function() {
              // Create overlay element
              const overlay = document.createElement('div');
              overlay.id = 'language-loading-overlay';
              overlay.style.position = 'fixed';
              overlay.style.top = '0';
              overlay.style.left = '0';
              overlay.style.width = '100%';
              overlay.style.height = '100%';
              overlay.style.backgroundColor = 'white';
              overlay.style.display = 'flex';
              overlay.style.justifyContent = 'center';
              overlay.style.alignItems = 'center';
              overlay.style.zIndex = '9999';
              
              // Create spinner
              const spinner = document.createElement('div');
              spinner.className = 'loading-spinner';
              spinner.style.width = '50px';
              spinner.style.height = '50px';
              spinner.style.border = '5px solid #f3f3f3';
              spinner.style.borderTop = '5px solid #3498db';
              spinner.style.borderRadius = '50%';
              spinner.style.animation = 'spin 1s linear infinite';
              
              // Add CSS animation
              const style = document.createElement('style');
              style.textContent = '@keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }';
              
              document.head.appendChild(style);
              overlay.appendChild(spinner);
              document.body.appendChild(overlay);
              
              // Create a function to hide the loader
              window.hideLanguageLoader = function() {
                overlay.style.opacity = '0';
                overlay.style.transition = 'opacity 0.5s ease-out';
                setTimeout(function() {
                  overlay.remove();
                }, 500);
              };
            });
          })();
          ''', []),
    ],
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
            [FontFamily('Roboto'), FontFamilies.sansSerif]),
      ),
      css('h1').styles(
        margin: Margin.unset,
        fontSize: 4.rem,
      ),
    ],
    body: App(),
  ));

  // Wait for language to load, then hide the loading overlay
  
}
