import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameValue {
  static String bestScoreKey = 'bestScoreKey';
  static double gameScreenRatio = 512.0 / 288.0;

  // Size
  static Vector2 playerSize = Vector2(51.0, 36.0);
  static double gameScreenHeight(double width) {
    return width * gameScreenRatio;
  }

  static Vector2 groundSize(Vector2 size) {
    return Vector2(size.x, size.y * 0.2);
  }

  static Vector2 scoringAreaSize = Vector2(1, 160);

  // Priority
  static const int startMenuPriority = 10;
  static const int gameOverMenuPriority = 10;
  static const int groundPriority = 5;
  static const int playerPriority = 0;
  static const int pipePriority = -2;
  static const int backgroundPriority = -10;

  // Velocity
  static const double gravity = 9.8;
  static const double groundVelocityX = 150.0;
  static const double pipeVelocityX = 150.0;
  static const double playerVelocityY = 200.0;

  // Color
  static const Color orange = Color(0xFFD8690E);
}
