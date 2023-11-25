import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:assets_audio_player/assets_audio_player.dart';

final assetsAudioPlayer1 = AssetsAudioPlayer();
final assetsAudioPlayer2 = AssetsAudioPlayer();

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
    playSound();

    //getAdvice();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/test.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Ratschlag:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 20),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    advice.isEmpty ? 'Kein Ratschlag vorhanden' : advice,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
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
      ),
    );
  }

  Future<void> getAdvice() async {
    final response =
        await http.get(Uri.parse('https://api.adviceslip.com/advice'));

    if (response.statusCode == 200) {
      buttonPressCount = 0;
      await assetsAudioPlayer2.open(
        Audio("assets/sounds/native-flute-transition.mp3"),
        autoStart: true,
      );

      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        advice = data['slip']['advice'];
      });
    } else {
      throw Exception('Failed to load advice');
    }
  }

  void playSound() async {
    try {
      await assetsAudioPlayer1.open(
          Audio("assets/sounds/restaurant-ambience.mp3"),
          autoStart: true,
          loopMode: LoopMode.single);
    } catch (t) {
      //mp3 unreachable
    }
  }
}
