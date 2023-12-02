import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/pages/flappy_bird/components/pipe/bottom_pipe.dart';
import 'package:flappy_bird/pages/flappy_bird/components/pipe/top_pipe.dart';
import 'package:flappy_bird/pages/flappy_bird/components/scoring_area.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';

class PipeGenerator {
  late Timer timer;
  final FlappyBirdGame gameRef;
  final double spwanInterval = 2;

  PipeGenerator(this.gameRef);

  void start() {
    timer = Timer(
      spwanInterval,
      onTick: () {
        final Random random = Random();
        final double startY = random.nextDouble() * 200 + 100;
        gameRef.world.addAll(
          [
            TopPipe(
              position: Vector2(gameRef.size.x + 50, startY),
            ),
            ScoringArea(
              position: Vector2(gameRef.size.x + 50, startY),
            ),
            BottomPipe(
              position: Vector2(
                gameRef.size.x + 50,
                startY + GameValue.scoringAreaSize.y,
              ),
            ),
          ],
        );
      },
      repeat: true,
    );
  }

  void stop() {
    timer.stop();
  }
}
