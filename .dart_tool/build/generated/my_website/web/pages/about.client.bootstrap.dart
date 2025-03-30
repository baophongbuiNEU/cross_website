
import 'about.client.dart' as app;
import 'package:my_website/web_plugin_registrant.dart';

Future<void> main() async {
  registerPlugins();
  return app.main();
}
    