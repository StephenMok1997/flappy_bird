import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/components/base.dart';
import 'package:flappy_bird/pages/flappy_bird/components/pipe/pipe.dart';
import 'package:flappy_bird/pages/flappy_bird/components/scoring_area.dart';
import 'package:flappy_bird/pages/flappy_bird/core/audio_manager.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';
import 'package:flappy_bird/pages/flappy_bird/enum/game_state.dart';
import 'package:flutter/widgets.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  Player()
      : super(
          size: GameValue.playerSize,
          priority: GameValue.playerPriority,
          anchor: Anchor.center,
        );

  final Vector2 fallingVelocity = Vector2.zero();
  final double maxAngle = tau / 4;
  double rotateVelocity = 0;
  int ticks = 0;

  @override
  FutureOr<void> onLoad() async {
    final ui.Image image = await Flame.images.load(
      Assets.images.birdSprite.path,
    );
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 0.10,
        textureSize: Vector2(34.0, 24.0),
      ),
    );
    position = Vector2(
      gameRef.size.x / 2,
      GameValue.gameScreenHeight(gameRef.size.x) * 0.25,
    );
    add(PolygonHitbox([
      Vector2(size.x * 0, size.y * 0.8),
      Vector2(size.x * 0, size.y * 0.6),
      Vector2(size.x * 0.08, size.y * 0.4),
      Vector2(size.x * 0.2, size.y * 0.15),
      Vector2(size.x * 0.4, 0),
      Vector2(size.x * 0.7, 0),
      Vector2(size.x * 0.8, size.y * 0.15),
      Vector2(size.x * 0.9, size.y * 0.3),
      Vector2(size.x * 0.95, size.y * 0.45),
      Vector2(size.x, size.y * 0.55),
      Vector2(size.x, size.y * 0.65),
      Vector2(size.x * 0.95, size.y * 0.75),
      Vector2(size.x * 0.85, size.y * 0.9),
      Vector2(size.x * 0.75, size.y * 0.95),
      Vector2(size.x * 0.65, size.y * 0.95),
      Vector2(size.x * 0.55, size.y),
      Vector2(0, size.y * 0.9),
    ]));
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (gameRef.gameState == GameState.running) {
      if (other is ScoringArea) {
        AudioManager.playPoint();
        gameRef.score++;
      } else if (other is Pipe || other is Ground) {
        AudioManager.playHit();
        gameRef.gameover();
      }
    }

    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    super.update(dt);
    fallingVelocity.y += GameValue.gravity;
    position.y = math.min(
      position.y + fallingVelocity.y * dt,
      GameValue.gameScreenHeight(gameRef.size.x) -
          GameValue.groundSize(
            Vector2(
              gameRef.size.x,
              GameValue.gameScreenHeight(gameRef.size.x),
            ),
          ).y -
          size.y / 2,
    );
    if (ticks > 0.35 * 60) {
      if (angle < maxAngle) {
        angle = math.min(angle + maxAngle * rotateVelocity, maxAngle);
        rotateVelocity += dt / 8;
      }
    } else {
      ticks++;
    }
  }

  void fly() {
    fallingVelocity.y = 0;
    rotateVelocity = 0;
    ticks = 0;
    AudioManager.playFlap();
    if (position.y > -400) {
      add(
        MoveByEffect(
          Vector2(0, -120),
          EffectController(
            duration: 0.5,
            curve: Curves.decelerate,
          ),
        ),
      );
    }

    add(
      RotateEffect.to(
        -tau / 12,
        EffectController(
          duration: 0.25,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}
