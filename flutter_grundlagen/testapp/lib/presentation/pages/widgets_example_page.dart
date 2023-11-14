import 'package:flutter/material.dart';
import 'package:testapp/presentation/widgets/container.text.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            ContainerText(),
            SizedBox(
              height: 20,
            ),
            ContainerText(),
          ],
        ),
      ),
    );
  }
}
