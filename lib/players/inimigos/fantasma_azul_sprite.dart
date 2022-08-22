import 'package:bonfire/bonfire.dart';

class FantasmaAzulSprite {
  static get idleLeft => SpriteAnimation.load(
        'players/inimigos/fantasma_azul_idle_esquerda.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get runLeft => SpriteAnimation.load(
        'players/inimigos/fantasma_azul_run_esquerda.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.15,
          textureSize: Vector2(20, 20),
        ),
      );

  static get idleRight => SpriteAnimation.load(
        'players/inimigos/fantasma_azul_idle_direita.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get runRight => SpriteAnimation.load(
        'players/inimigos/fantasma_azul_run_direita.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.15,
          textureSize: Vector2(20, 20),
        ),
      );
}
