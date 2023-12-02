import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';

class Medal extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Medal() : super();
  late ui.Image image;

  @override
  FutureOr<void> onLoad() async {
    await updateSprite();
    position = Vector2(41, 58);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    updateSprite();
    super.update(dt);
  }

  @override
  void onMount() {
    updateSprite();
    super.onMount();
  }

  Future<void> updateSprite() async {
    if (gameRef.score >= 10 && gameRef.score < 20) {
      image = await Flame.images.load(
        Assets.images.bronze.path,
      );
    } else if (gameRef.score >= 20 && gameRef.score < 30) {
      image = await Flame.images.load(
        Assets.images.sliver.path,
      );
    } else if (gameRef.score >= 30 && gameRef.score < 40) {
      image = await Flame.images.load(
        Assets.images.gold.path,
      );
    } else if (gameRef.score >= 40) {
      image = await Flame.images.load(
        Assets.images.platinum.path,
      );
    } else {
      image = await Flame.images.load(
        Assets.images.transparent.path,
      );
    }
    sprite = Sprite(image);
  }
}
