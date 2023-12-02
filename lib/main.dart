import 'package:flappy_bird/pages/flappy_bird/flappy_bird_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FlappyBirdPage());
  }
}
