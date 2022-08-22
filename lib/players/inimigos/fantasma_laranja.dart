import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';

import '../pacman/pac_man.dart';
import 'fantasma.dart';
import 'fantasma_laranja_sprite.dart';

class FantasmaLaranja extends Fantasma {
  FantasmaLaranja({required super.position, required PacMan pacMan, required Vector2 posicaoInicial})
      : super(pacMan: pacMan, simpleDirectionAnimation: simpleDirectionAnimationGetter, posicaoInicial: posicaoInicial);

  static SimpleDirectionAnimation get simpleDirectionAnimationGetter => SimpleDirectionAnimation(
        idleRight: FantasmaLaranjaSprite.idleRight,
        runRight: FantasmaLaranjaSprite.runRight,
        idleLeft: FantasmaLaranjaSprite.idleLeft,
        runLeft: FantasmaLaranjaSprite.runLeft,
      );
}
