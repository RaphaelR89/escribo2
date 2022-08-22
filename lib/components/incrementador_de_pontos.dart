import 'package:flutter/widgets.dart';
import 'package:teste_tecnico_02_escribo/players/pacman/pac_man.dart';

class IncrementadorDePontos extends ChangeNotifier {
  PacMan player;
  void incrementar() {
    player.points = player.points + 10;
    notifyListeners();
  }

  IncrementadorDePontos({
    required this.player,
  });
}
