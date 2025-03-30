// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/browser.dart';
import 'pages/about.client.dart' deferred as prefix0;
import 'pages/home.client.dart' deferred as prefix1;
import 'app.client.dart' deferred as prefix2;

void main() {
  registerClients({
    'app': loadClient(prefix2.loadLibrary, (p) => prefix2.getComponentForParams(p)),
    'pages/about': loadClient(prefix0.loadLibrary, (p) => prefix0.getComponentForParams(p)),
    'pages/home': loadClient(prefix1.loadLibrary, (p) => prefix1.getComponentForParams(p)),
  });
}
