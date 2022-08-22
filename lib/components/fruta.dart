import 'package:bonfire/bonfire.dart';
import 'package:teste_tecnico_02_escribo/players/pacman/pac_man.dart';

class Fruta extends GameDecoration with Sensor {
  final PacMan pacMan;

  Fruta({required Vector2 position, required this.pacMan}) : super.withSprite(sprite: Sprite.load('fruta_no_chao.png'), position: position, size: Vector2(30, 30)) {
    setupSensorArea(intervalCheck: 100);
  }

  @override
  void onContact(GameComponent component) {
    if (component is PacMan) {
      pacMan.ativarPoder();
      removeFromParent();
    }
  }
}
