import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';
import 'package:flappy_bird/pages/flappy_bird/enum/game_state.dart';

class Base extends PositionComponent with HasGameRef<FlappyBirdGame> {
  Base()
      : super(
          priority: GameValue.groundPriority,
          anchor: Anchor.topLeft,
        );

  @override
  FutureOr<void> onLoad() async {
    addAll(
      [
        Ground(
          positionX: 0,
        ),
        Ground(
          positionX: gameRef.size.x,
        ),
      ],
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (gameRef.gameState == GameState.running) {
      position.x -= dt * GameValue.groundVelocityX;
    }
    if (position.x < -gameRef.size.x) {
      position.x = 0;
    }
  }
}

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Ground({
    required this.positionX,
  }) : super(
          priority: GameValue.groundPriority,
          anchor: Anchor.topLeft,
        );
  final double positionX;

  @override
  FutureOr<void> onLoad() async {
    final ui.Image image = await Flame.images.load(
      Assets.images.ground.path,
    );
    sprite = Sprite(image);

    size = GameValue.groundSize(
      Vector2(
        gameRef.size.x,
        GameValue.gameScreenHeight(gameRef.size.x),
      ),
    );
    position = Vector2(
      positionX,
      GameValue.gameScreenHeight(gameRef.size.x) - size.y,
    );
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }
}
