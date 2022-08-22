import 'package:bonfire/bonfire.dart';

import '../pacman/pac_man.dart';
import 'fantasma.dart';
import 'fantasma_azul_sprite.dart';

class FantasmaAzul extends Fantasma {
  FantasmaAzul({required super.position, required PacMan pacMan, required Vector2 posicaoInicial})
      : super(
          pacMan: pacMan,
          simpleDirectionAnimation: simpleDirectionAnimationGetter,
          posicaoInicial: posicaoInicial,
        );

  static SimpleDirectionAnimation get simpleDirectionAnimationGetter => SimpleDirectionAnimation(
        idleRight: FantasmaAzulSprite.idleRight,
        runRight: FantasmaAzulSprite.runRight,
        idleLeft: FantasmaAzulSprite.idleLeft,
        runLeft: FantasmaAzulSprite.runLeft,
      );
}
