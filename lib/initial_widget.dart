import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico_02_escribo/players/pacman/pac_man.dart';

import 'app_widget.dart';
import 'components/estado_do_jogo.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider.value(value: PacMan(null, estadoDoJogo: context.read<EstadoDoJogo>()))
    ], child: const AppWidget());
  }
}
