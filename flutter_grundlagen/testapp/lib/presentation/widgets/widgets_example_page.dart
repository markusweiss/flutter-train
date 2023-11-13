import 'package:flutter/material.dart';

class WidgetsExamplePage extends StatelessWidget {
  const WidgetsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Test App"),
        ),
      ),
      body: const Center(
        child: Text("Hallo Welt!"),
      ),
    );
  }
}
