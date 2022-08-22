import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico_02_escribo/components/incrementador_de_pontos.dart';
import 'package:teste_tecnico_02_escribo/game.dart';
import 'package:teste_tecnico_02_escribo/players/pacman/pac_man.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: MultiProvider(providers: [
              ChangeNotifierProvider.value(value: IncrementadorDePontos(player:context.read<PacMan>())),
            ], child: const Game())),
      ),
    );
  }
}
