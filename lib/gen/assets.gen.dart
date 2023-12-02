/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/flap.mp3
  String get flap => 'assets/audio/flap.mp3';

  /// File path: assets/audio/hit.mp3
  String get hit => 'assets/audio/hit.mp3';

  /// File path: assets/audio/point.mp3
  String get point => 'assets/audio/point.mp3';

  /// List of all assets
  List<String> get values => [flap, hit, point];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/back_button.png
  AssetGenImage get backButton =>
      const AssetGenImage('assets/images/back_button.png');

  /// File path: assets/images/background_day.png
  AssetGenImage get backgroundDay =>
      const AssetGenImage('assets/images/background_day.png');

  /// File path: assets/images/bird_sprite.png
  AssetGenImage get birdSprite =>
      const AssetGenImage('assets/images/bird_sprite.png');

  /// File path: assets/images/bottom_pipe.png
  AssetGenImage get bottomPipe =>
      const AssetGenImage('assets/images/bottom_pipe.png');

  /// File path: assets/images/bronze.png
  AssetGenImage get bronze => const AssetGenImage('assets/images/bronze.png');

  /// File path: assets/images/game_start_message.png
  AssetGenImage get gameStartMessage =>
      const AssetGenImage('assets/images/game_start_message.png');

  /// File path: assets/images/gameover.png
  AssetGenImage get gameover =>
      const AssetGenImage('assets/images/gameover.png');

  /// File path: assets/images/gold.png
  AssetGenImage get gold => const AssetGenImage('assets/images/gold.png');

  /// File path: assets/images/ground.png
  AssetGenImage get ground => const AssetGenImage('assets/images/ground.png');

  /// File path: assets/images/platinum.png
  AssetGenImage get platinum =>
      const AssetGenImage('assets/images/platinum.png');

  /// File path: assets/images/restart_button.png
  AssetGenImage get restartButton =>
      const AssetGenImage('assets/images/restart_button.png');

  /// File path: assets/images/scoreboard.png
  AssetGenImage get scoreboard =>
      const AssetGenImage('assets/images/scoreboard.png');

  /// File path: assets/images/sliver.png
  AssetGenImage get sliver => const AssetGenImage('assets/images/sliver.png');

  /// File path: assets/images/top_pipe.png
  AssetGenImage get topPipe =>
      const AssetGenImage('assets/images/top_pipe.png');

  /// File path: assets/images/transparent.png
  AssetGenImage get transparent =>
      const AssetGenImage('assets/images/transparent.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        backButton,
        backgroundDay,
        birdSprite,
        bottomPipe,
        bronze,
        gameStartMessage,
        gameover,
        gold,
        ground,
        platinum,
        restartButton,
        scoreboard,
        sliver,
        topPipe,
        transparent
      ];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
