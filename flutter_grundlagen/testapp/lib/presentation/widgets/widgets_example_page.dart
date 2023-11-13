import 'package:flutter/material.dart';

class WidgetsExamplePage extends StatelessWidget {
  const WidgetsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: const Icon(
          Icons.home,
          size: 30,
        ),
        centerTitle: true,
        title: const Text("Test App"),
      ),
      body: const Center(
        child: Text("Hallo Welt!"),
      ),
    );
  }
}
