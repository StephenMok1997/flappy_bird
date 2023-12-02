import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background() : super(priority: GameValue.backgroundPriority);
  @override
  FutureOr<void> onLoad() async {
    final ui.Image image = await Flame.images.load(
      Assets.images.backgroundDay.path,
    );
    sprite = Sprite(image);
    size = Vector2(
      gameRef.size.x,
      GameValue.gameScreenHeight(gameRef.size.x),
    );
    return super.onLoad();
  }
}
