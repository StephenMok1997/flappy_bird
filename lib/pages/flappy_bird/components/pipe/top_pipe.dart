import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/components/pipe/pipe.dart';

class TopPipe extends Pipe {
  TopPipe({
    required super.position,
    super.anchor = Anchor.bottomCenter,
  }) : super();

  @override
  FutureOr<void> onLoad() async {
    final ui.Image image = await Flame.images.load(
      Assets.images.topPipe.path,
    );
    sprite = Sprite(image);
    add(RectangleHitbox(position: Vector2(0, -size.y), size: size));
    return super.onLoad();
  }
}
