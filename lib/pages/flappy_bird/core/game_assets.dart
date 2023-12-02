import 'package:flame/components.dart';
import 'package:flappy_bird/pages/flappy_bird/components/background.dart';
import 'package:flappy_bird/pages/flappy_bird/components/base.dart';
import 'package:flappy_bird/pages/flappy_bird/components/player.dart';

class GameAssets {
  late Player player;
  late Background background;
  late Base base;
  GameAssets();

  void initialAssets() {
    player = Player();
    background = Background();
    base = Base();
  }

  List<PositionComponent> getAllInitAssets() {
    return [
      background,
      base,
    ];
  }
}
