import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BorderText extends TextComponent {
  BorderText({
    required super.position,
    this.borderColor = Colors.black,
    this.textColor = Colors.white,
    this.fontSize = 32.0,
    this.textShadow = const [],
    super.anchor = Anchor.center,
    super.text,
  }) : super();

  final double fontSize;
  final Color borderColor;
  final Color textColor;
  final List<Shadow> textShadow;

  @override
  FutureOr<void> onLoad() {
    textRenderer = TextPaint(
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontFamily: 'FlappyBird',
        shadows: [
          Shadow(
            // bottomLeft
            offset: const Offset(-2, -2),
            color: borderColor,
          ),
          Shadow(
            // bottomRight
            offset: const Offset(2, -2),
            color: borderColor,
          ),
          Shadow(
            // topRight
            offset: const Offset(2, 2),
            color: borderColor,
          ),
          Shadow(
            // topLeft
            offset: const Offset(-2, 2),
            color: borderColor,
          ),
          ...textShadow,
        ],
      ),
    );
    return super.onLoad();
  }
}
