import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_hud/border_text.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_start_message.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';

class StartMenu extends PositionComponent with HasGameRef<FlappyBirdGame> {
  StartMenu()
      : super(
          anchor: Anchor.center,
          priority: GameValue.startMenuPriority,
        );
  @override
  FutureOr<void> onLoad() {
    add(GameStartMessage());
    add(
      BorderText(
        text: '(c) .GEARS Studios 2013',
        position: Vector2(
          gameRef.size.x / 2,
          GameValue.gameScreenHeight(gameRef.size.x) - 20.0,
        ),
        fontSize: 20.0,
        borderColor: GameValue.orange,
        anchor: Anchor.bottomCenter,
      ),
    );
    return super.onLoad();
  }
}
