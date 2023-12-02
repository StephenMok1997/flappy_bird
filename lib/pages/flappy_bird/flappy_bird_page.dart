import 'package:flame/game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class FlappyBirdPage extends StatelessWidget {
  const FlappyBirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: FlappyBirdGame(),
    );
  }
}
