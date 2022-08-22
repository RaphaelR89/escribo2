import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';
import 'package:teste_tecnico_02_escribo/players/inimigos/fantasma.dart';
import 'package:teste_tecnico_02_escribo/players/pacman/pac_man.dart';

import 'fantasma_vermelho_sprite.dart';

class FantasmaVermelho extends Fantasma {
  FantasmaVermelho({required super.position, required PacMan pacMan, required posicaoInicial})
      : super(pacMan: pacMan, simpleDirectionAnimation: simpleDirectionAnimationGetter, posicaoInicial: posicaoInicial);

  static SimpleDirectionAnimation get simpleDirectionAnimationGetter => SimpleDirectionAnimation(
        idleRight: FantasmaVermelhoSprite.idleRight,
        runRight: FantasmaVermelhoSprite.runRight,
        idleLeft: FantasmaVermelhoSprite.idleLeft,
        runLeft: FantasmaVermelhoSprite.runLeft,
      );
}
