import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico_02_escribo/components/incrementador_de_pontos.dart';
import 'package:teste_tecnico_02_escribo/players/pacman/pac_man.dart';

class ContadorDePontosWidget extends StatefulWidget {
  ContadorDePontosWidget({Key? key}) : super(key: key);

  @override
  State<ContadorDePontosWidget> createState() => _ContadorDePontosWidgetState();
}

class _ContadorDePontosWidgetState extends State<ContadorDePontosWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IncrementadorDePontos>(
      builder: (BuildContext context, IncrementadorDePontos value, Widget? child){
        return Text(
          context.read<PacMan>().points.toString(),
          style: const TextStyle(color: Colors.green, fontSize: 26),
        );
      },
    );
  }
}
