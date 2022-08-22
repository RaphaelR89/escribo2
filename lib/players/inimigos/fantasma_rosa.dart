import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';

import '../pacman/pac_man.dart';
import 'fantasma.dart';
import 'fantasma_rosa_sprite.dart';

class FantasmaRosa extends Fantasma {
  FantasmaRosa({required super.position, required PacMan pacMan, required Vector2 posicaoInicial})
      : super(pacMan: pacMan, simpleDirectionAnimation: simpleDirectionAnimationGetter, posicaoInicial: posicaoInicial);

  static SimpleDirectionAnimation get simpleDirectionAnimationGetter => SimpleDirectionAnimation(
        idleRight: FantasmaRosaSprite.idleRight,
        runRight: FantasmaRosaSprite.runRight,
        idleLeft: FantasmaRosaSprite.idleLeft,
        runLeft: FantasmaRosaSprite.runLeft,
      );
}
