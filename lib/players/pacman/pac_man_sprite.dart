import 'package:bonfire/bonfire.dart';

class PacManSprite {
  static get idleRight => SpriteAnimation.load(
        'players/pacman/pacman_1_direita.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get idleLeft => SpriteAnimation.load(
        'players/pacman/pacman_1_esquerda.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get idleUp => SpriteAnimation.load(
        'players/pacman/pacman_1_cima.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get idleDown => SpriteAnimation.load(
        'players/pacman/pacman_1_baixo.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get runRight => SpriteAnimation.load(
        'players/pacman/pacman_direita.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get runLeft => SpriteAnimation.load(
        'players/pacman/pacman_esquerda.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get runUp => SpriteAnimation.load(
        'players/pacman/pacman_cima.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get runDown => SpriteAnimation.load(
        'players/pacman/pacman_baixo.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
        ),
      );

  static get pacManDead => SpriteAnimation.load(
        'players/pacman/morte_pac_man.png',
        SpriteAnimationData.sequenced(
          amount: 11,
          stepTime: 0.1,
          textureSize: Vector2(20, 20),
          loop: false,
        ),
      );
}
