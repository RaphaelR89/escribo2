import 'package:bonfire/bonfire.dart';
import 'package:teste_tecnico_02_escribo/players/inimigos/fantasma_sprite.dart';

import '../pacman/pac_man.dart';

class Fantasma extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement, Sensor {
  SimpleDirectionAnimation simpleDirectionAnimation;
  PacMan pacMan;
  double radiusCollision = 6;
  Vector2 posicaoInicial;

  Fantasma({required Vector2 position, required this.simpleDirectionAnimation, required this.pacMan, required this.posicaoInicial})
      : super(
          position: position,
          size: Vector2(32, 32),
          animation: simpleDirectionAnimation,
          speed: 80,
        ) {
    setupCollision(CollisionConfig(collisions: [CollisionArea.rectangle(size: Vector2(30, 30), align: Vector2(1, 1))]));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!teveContato) {
      if (pacMan.modoPoderosoAtivado) {
        replaceAnimation(SimpleDirectionAnimation(idleRight: FantasmaSprite.medo, runRight: FantasmaSprite.medo));

        speed = 65;
        Future.delayed(const Duration(seconds: 8), () {
          replaceAnimation(simpleDirectionAnimation);
          speed = 80;
        });
        seeAndMoveToAttackRange(
            minDistanceFromPlayer: 300,
            positioned: (p) {},
            radiusVision: 64,
            notObserved: () {
              runRandomMovement(dt, maxDistance: 200, minDistance: 100, speed: speed, timeKeepStopped: 20);
            });
      } else {
        seeAndMoveToPlayer(
            margin: 0,
            radiusVision: 32,
            closePlayer: (player) {},
            notObserved: () {
              runRandomMovement(dt, maxDistance: 200, minDistance: 100, speed: speed, timeKeepStopped: 20);
            });
      }
    }
  }

  bool teveContato = false;

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      teveContato = true;
      if (pacMan.modoPoderosoAtivado) {
        gameRef.add(GameDecoration.withAnimation(animation: FantasmaSprite.explosion, position: position, size: size));
        Future.delayed(const Duration(milliseconds: 1400), () {
          position = posicaoInicial;
          teveContato = false;
        });
      } else {
        component.die();
      }
    }
  }
  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is SimpleEnemy){
      return false;
    }
    return super.onCollision(component, active);
  }
}
