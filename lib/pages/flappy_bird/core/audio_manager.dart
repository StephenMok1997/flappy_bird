import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:just_audio/just_audio.dart' as ja;

class AudioManager {
  static final ja.AudioPlayer hitPlayer = ja.AudioPlayer()
    ..setAsset(Assets.audio.hit);
  static final ja.AudioPlayer pointPlayer = ja.AudioPlayer()
    ..setAsset(Assets.audio.point);

  static void playFlap() async {
    final ja.AudioPlayer flapPlayer = ja.AudioPlayer()
      ..setAsset(Assets.audio.flap);
    await flapPlayer.seek(Duration.zero);
    await flapPlayer.play();
    await flapPlayer.dispose();
  }

  static void playHit() async {
    await hitPlayer.seek(Duration.zero);
    await hitPlayer.play();
  }

  static void playPoint() async {
    await pointPlayer.seek(Duration.zero);
    await pointPlayer.play();
  }
}
