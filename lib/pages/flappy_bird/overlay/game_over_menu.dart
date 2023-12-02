import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_over/back_button.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_over/game_over.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_over/restart_button.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_over/scoreboard.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';

class GameOverMenu extends PositionComponent with HasGameRef<FlappyBirdGame> {
  GameOverMenu()
      : super(
          anchor: Anchor.center,
          priority: GameValue.gameOverMenuPriority,
        );

  @override
  FutureOr<void> onLoad() {
    add(GameOver());
    add(Scoreboard());
    add(RestartButton());
    add(BackButton());
    position = Vector2(
      gameRef.size.x / 2,
      GameValue.gameScreenHeight(gameRef.size.x) / 4,
    );
    return super.onLoad();
  }
}
