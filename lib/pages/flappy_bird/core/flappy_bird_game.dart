import 'dart:async';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_assets.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';
import 'package:flappy_bird/pages/flappy_bird/enum/game_state.dart';
import 'package:flappy_bird/pages/flappy_bird/overlay/game_hud.dart';
import 'package:flappy_bird/pages/flappy_bird/overlay/game_over_menu.dart';
import 'package:flappy_bird/pages/flappy_bird/overlay/start_menu.dart';
import 'package:flappy_bird/pages/flappy_bird/scripts/pipe_generator.dart';

class FlappyBirdGame extends FlameGame
    with HasCollisionDetection, TapCallbacks {
  @override
  late final World world;
  late final CameraComponent cameraComponent;
  late final GameAssets gameAssets;
  late final PipeGenerator pipeGenerator = PipeGenerator(this);
  GameState gameState = GameState.initial;
  int score = 0;
  StartMenu startMenu = StartMenu();
  GameHud gameHud = GameHud();
  GameOverMenu gameOverMenu = GameOverMenu();

  @override
  FutureOr<void> onLoad() async {
    Flame.images = Images(prefix: '');
    FlameAudio.audioCache = AudioCache(prefix: '');
    world = World();
    cameraComponent = CameraComponent.withFixedResolution(
      world: world,
      width: size.x,
      height: GameValue.gameScreenHeight(size.x),
    );
    cameraComponent.viewfinder.position = Vector2(
      size.x / 2,
      size.x * GameValue.gameScreenRatio / 2,
    );

    await addAll([
      world,
      cameraComponent,
    ]);

    gameAssets = GameAssets();
    gameAssets.initialAssets();
    await world.addAll([
      ...gameAssets.getAllInitAssets(),
      ScreenHitbox(),
    ]);
    await cameraComponent.viewport.add(startMenu);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (gameState == GameState.running) {
      pipeGenerator.timer.update(dt);
    } else if (gameState == GameState.gameover) {}
    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) async {
    super.onTapDown(event);
    if (gameState == GameState.initial) {
      await startGame();
    } else if (gameState == GameState.running) {
      gameAssets.player.fly();
    } else {
      return;
    }
  }

  Future<void> startGame() async {
    cameraComponent.viewport.removeWhere(
      (component) => component == startMenu,
    );
    await world.add(gameAssets.player);
    await cameraComponent.viewport.add(gameHud);
    pipeGenerator.start();
    gameState = GameState.running;
  }

  Future<void> restartGame() async {
    await initialize();
    await startGame();
  }

  Future<void> initialize() async {
    score = 0;
    cameraComponent.viewport.remove(gameOverMenu);
    world.removeAll(world.children);
    gameAssets.initialAssets();
    await world.addAll([
      ...gameAssets.getAllInitAssets(),
    ]);
    gameState = GameState.initial;
  }

  void gameover() async {
    gameState = GameState.gameover;
    pipeGenerator.stop();
    cameraComponent.viewport.remove(gameHud);
    await cameraComponent.viewport.add(gameOverMenu);
  }

  Future<void> backToStart() async {
    await initialize();
    await cameraComponent.viewport.add(startMenu);
  }
}
