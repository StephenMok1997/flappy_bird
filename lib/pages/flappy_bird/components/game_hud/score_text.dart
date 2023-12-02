import 'package:flame/components.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_hud/border_text.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';

class ScoreText extends BorderText with HasGameRef<FlappyBirdGame> {
  ScoreText({
    required super.position,
    super.fontSize,
    super.anchor = Anchor.center,
  }) : super(
          textShadow: const [
            Shadow(
              offset: Offset(4, 4),
            )
          ],
        );

  @override
  void update(double dt) {
    text = '${gameRef.score}';
  }
}
