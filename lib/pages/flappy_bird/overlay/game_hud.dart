import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_hud/score_text.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';

class GameHud extends PositionComponent with HasGameRef<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() {
    add(
      ScoreText(
        position: Vector2(
          gameRef.size.x / 2,
          80.0,
        ),
      ),
    );
    return super.onLoad();
  }
}
