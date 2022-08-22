import 'package:bonfire/bonfire.dart';
import 'package:teste_tecnico_02_escribo/components/estado_do_jogo.dart';
import 'package:teste_tecnico_02_escribo/players/pacman/pac_man_sprite.dart';

class PacMan extends SimplePlayer with ObjectCollision {
  PacMan(Vector2? position, {required this.estadoDoJogo, this.points = 0})
      : super(
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: PacManSprite.idleRight,
            runRight: PacManSprite.runRight,
            idleLeft: PacManSprite.idleLeft,
            runLeft: PacManSprite.runLeft,
            idleUp: PacManSprite.idleUp,
            runUp: PacManSprite.runUp,
            idleDown: PacManSprite.idleDown,
            runDown: PacManSprite.runDown,
          ),
          position: position ?? Vector2(10, 10),
          speed: 40,
        ) {
    setupCollision(CollisionConfig(collisions: [CollisionArea.rectangle(size: Vector2(30, 30))]));

  }
  double points;
  bool modoPoderosoAtivado = false;
  EstadoDoJogo estadoDoJogo;
  bool moverDireita = false;
  bool moverEsquerda = false;
  bool moverCima = false;
  bool moverBaixo = false;

  @override
  void update(double dt) {

    if (moverDireita) {
      moveRight(speed);
    }
    if (moverEsquerda) {
      moveLeft(speed);
    }
    if (moverCima) {
      moveUp(speed);
    }
    if (moverBaixo) {
      moveDown(speed);
    }
    super.update(dt);
  }

  @override
  bool moveRight(double speed, {bool notifyOnMove = true}) {

    moverEsquerda = false;
    moverCima = false;
    moverBaixo = false;
    moverDireita = true;
    return super.moveRight(speed);
  }

  @override
  bool moveLeft(double speed, {bool notifyOnMove = true}) {
    moverEsquerda = true;
    moverCima = false;
    moverBaixo = false;
    moverDireita = false;

    return super.moveLeft(speed);
  }

  @override
  bool moveUp(double speed, {bool notifyOnMove = true}) {
    moverEsquerda = false;
    moverCima = true;
    moverBaixo = false;
    moverDireita = false;
    return super.moveUp(speed);
  }

  @override
  bool moveDown(double speed, {bool notifyOnMove = true}) {
    moverEsquerda = false;
    moverCima = false;
    moverBaixo = true;
    moverDireita = false;
    return super.moveDown(speed);
  }

  @override
  void die() {
    gameRef.add(GameDecoration.withAnimation(animation: PacManSprite.pacManDead, position: position, size: size));
    removeFromParent();
    estadoDoJogo.finalizarJogo();
    super.die();
  }

  PacMan setPositon(Vector2 position, EstadoDoJogo estadoDoJogo) {
    return PacMan(position, estadoDoJogo: estadoDoJogo);
  }

  void ativarPoder() {
    modoPoderosoAtivado = true;
    Future.delayed(const Duration(seconds: 8), () {
      modoPoderosoAtivado = false;
    });
  }
}
