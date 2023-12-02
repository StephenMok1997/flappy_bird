import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';

class RestartButton extends SpriteComponent
    with TapCallbacks, HasGameRef<FlappyBirdGame> {
  RestartButton({
    super.position,
  }) : super(anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() async {
    final ui.Image image = await Flame.images.load(
      Assets.images.restartButton.path,
    );
    position = Vector2(-50, 300);
    size = Vector2.all(64.0);
    sprite = Sprite(image);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) async {
    if (isLoaded) {
      await gameRef.restartGame();
    }
    super.onTapDown(event);
  }
}
