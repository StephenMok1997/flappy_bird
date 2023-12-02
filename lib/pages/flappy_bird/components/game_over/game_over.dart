import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';

class GameOver extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  GameOver()
      : super(
          anchor: Anchor.center,
        );

  @override
  FutureOr<void> onLoad() async {
    final ui.Image image = await Flame.images.load(
      Assets.images.gameover.path,
    );
    sprite = Sprite(image);
    return super.onLoad();
  }
}
