import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';
import 'package:flappy_bird/pages/flappy_bird/enum/game_state.dart';

class Pipe extends SpriteComponent
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Pipe({
    super.position,
    super.anchor,
    super.size,
  });
  @override
  FutureOr<void> onLoad() {
    priority = GameValue.pipePriority;
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.gameState == GameState.running) {
      position.x -= GameValue.pipeVelocityX * dt;
    }
    if (position.x < 0 - size.x / 2) {
      gameRef.world.remove(this);
    }
  }
}
