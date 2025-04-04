import 'package:flutter/material.dart';
import 'package:test_flutter/lists.dart';
import 'package:test_flutter/new_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Lists(),
        '/new_page': (context) => const NewPage(),
      },
    );
  }
}
