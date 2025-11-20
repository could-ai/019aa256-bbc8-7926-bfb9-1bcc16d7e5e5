import 'package:flutter/material.dart';
import 'screens/main_menu.dart';
import 'screens/game_play_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echoes of Eternity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Arial', // Fallback font
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainMenuScreen(),
        '/game': (context) => const GamePlayScreen(),
      },
    );
  }
}
