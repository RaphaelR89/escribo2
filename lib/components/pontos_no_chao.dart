import 'package:bonfire/bonfire.dart';
import 'package:teste_tecnico_02_escribo/components/incrementador_de_pontos.dart';

class PontosNoChao extends GameDecoration with Sensor {
  final IncrementadorDePontos incrementadorDePontos;
  final Player player;

  PontosNoChao({required Vector2 position, required this.incrementadorDePontos, required this.player})
      : super.withSprite(sprite: Sprite.load('ponto_no_chao.png'), position: position, size: Vector2(10, 10)) {
    setupSensorArea(intervalCheck: 320, areaSensor: [CollisionArea.rectangle(size: Vector2(5, 5))]);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      incrementadorDePontos.incrementar();
      removeFromParent();
    }
  }
}
