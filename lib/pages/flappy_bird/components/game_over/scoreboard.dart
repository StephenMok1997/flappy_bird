import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_hud/border_text.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_hud/score_text.dart';
import 'package:flappy_bird/pages/flappy_bird/components/game_over/medal.dart';
import 'package:flappy_bird/pages/flappy_bird/core/flappy_bird_game.dart';
import 'package:flappy_bird/pages/flappy_bird/core/game_values.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scoreboard extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Scoreboard()
      : super(
          anchor: Anchor.center,
        );

  late final SharedPreferences prefs;
  late BorderText bestScoreText;
  late int bestScore = 0;

  @override
  FutureOr<void> onLoad() async {
    prefs = await SharedPreferences.getInstance();

    final ui.Image image = await Flame.images.load(
      Assets.images.scoreboard.path,
    );
    position = Vector2(0, 125);
    sprite = Sprite(image);
    bestScoreText = BorderText(
      text: bestScore.toString(),
      fontSize: 24.0,
      position: Vector2(285, 104),
      anchor: Anchor.topRight,
      textShadow: const [
        Shadow(
          offset: Offset(4, 4),
        )
      ],
    );
    add(
      ScoreText(
        fontSize: 24.0,
        position: Vector2(285, 48),
        anchor: Anchor.topRight,
      ),
    );
    add(bestScoreText);
    add(Medal());
    return super.onLoad();
  }

  @override
  void onMount() async {
    bestScore = prefs.getInt(GameValue.bestScoreKey) ?? 0;
    if (bestScore < gameRef.score) {
      bestScore = bestScore < gameRef.score ? gameRef.score : bestScore;
      await prefs.setInt(
        GameValue.bestScoreKey,
        bestScore,
      );
    }
    bestScoreText.text = bestScore.toString();
    super.onMount();
  }
}
