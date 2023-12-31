import 'package:flutter/material.dart';
import 'package:testapp/presentation/pages/widgets_example_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: true, home: WidgetsExamplePage());
  }
}
