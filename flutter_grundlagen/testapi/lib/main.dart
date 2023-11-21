import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String advice = "";
  int buttonPressCount = 0;

  @override
  void initState() {
    super.initState();
    //getAdvice();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Advice App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Ratschlag:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  advice.isEmpty ? 'Kein Ratschlag vorhanden' : advice,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (buttonPressCount < 5) {
                    setState(() {
                      buttonPressCount++;
                    });
                  } else {
                    getAdvice();
                  }
                },
                child: Text(buttonPressCount < 5
                    ? 'Button drücken (${5 - buttonPressCount} verbleibend)'
                    : 'Ratschlag erhalten'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAdvice() async {
    final response =
        await http.get(Uri.parse('https://api.adviceslip.com/advice'));

    if (response.statusCode == 200) {
      buttonPressCount = 0;
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        advice = data['slip']['advice'];
      });
    } else {
      throw Exception('Failed to load advice');
    }
  }
}
