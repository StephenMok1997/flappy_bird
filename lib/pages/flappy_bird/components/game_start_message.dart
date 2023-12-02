import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';
import 'package:flutter/material.dart';

class GameStartMessage extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  GameStartMessage()
      : super(
          anchor: Anchor.center,
          priority: GameValue.startMenuPriority,
        );

  @override
  FutureOr<void> onLoad() async {
    final ui.Image image = await Flame.images.load(
      Assets.images.gameStartMessage.path,
    );
    position = Vector2(
      gameRef.size.x / 2,
      GameValue.gameScreenHeight(gameRef.size.x) / 2,
    );
    sprite = Sprite(image);
    final Effect effect = MoveByEffect(
      Vector2(0, -5),
      EffectController(
        duration: 1,
        curve: Curves.ease,
        infinite: true,
        alternate: true,
      ),
    );
    add(effect);

    return super.onLoad();
  }
}
