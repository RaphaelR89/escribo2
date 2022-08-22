import 'package:bonfire/bonfire.dart';

class SpritesDoGame {
  static Future<SpriteAnimation> pontosNoChao() => SpriteAnimation.load(
        'ponto_no_chao.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 1,
          textureSize: Vector2(10, 10),
        ),
      );

  static Future<SpriteAnimation> frutasNoChao() => SpriteAnimation.load(
        'fruta_no_chao.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 1,
          textureSize: Vector2(10, 10),
        ),
      );
}
