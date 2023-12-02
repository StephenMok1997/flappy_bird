import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/components/pipe/pipe.dart';

class BottomPipe extends Pipe {
  BottomPipe({
    required super.position,
    super.anchor = Anchor.topCenter,
  }) : super();

  @override
  FutureOr<void> onLoad() async {
    final ui.Image image = await Flame.images.load(
      Assets.images.bottomPipe.path,
    );
    sprite = Sprite(image);
    return super.onLoad();
  }
}
