import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico_02_escribo/components/contador_de_pontos_widget.dart';
import 'package:teste_tecnico_02_escribo/components/estado_do_jogo.dart';
import 'package:teste_tecnico_02_escribo/components/fruta.dart';
import 'package:teste_tecnico_02_escribo/components/incrementador_de_pontos.dart';
import 'package:teste_tecnico_02_escribo/components/pontos_no_chao.dart';
import 'package:teste_tecnico_02_escribo/initial_widget.dart';
import 'package:teste_tecnico_02_escribo/players/inimigos/fantasma_azul.dart';
import 'package:teste_tecnico_02_escribo/players/inimigos/fantasma_laranja.dart';
import 'package:teste_tecnico_02_escribo/players/inimigos/fantasma_rosa.dart';
import 'package:teste_tecnico_02_escribo/players/inimigos/fantasma_vermelho.dart';
import 'package:teste_tecnico_02_escribo/players/pacman/pac_man.dart';

import 'components/ancora_camera/ancora_camera.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Consumer(
          builder: (BuildContext context, IncrementadorDePontos pontos, Widget? child) {
            if (context.read<IncrementadorDePontos>().player.points == 810) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => showDialog(context: context, builder: (_) {
                return AlertDialog(
                  title: const Text('Vitória!!'),
                  content: const Text('Parabéns! Você concluiu o mapa. Deseja jogar novamente?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.read<EstadoDoJogo>().retomarJogo();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InitialWidget()));
                      },
                      child: const Text('Sim'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Não'),
                    ),
                  ],
                );
              }));
            }
            return Consumer<EstadoDoJogo>(
              builder: (BuildContext context, EstadoDoJogo value, Widget? child) {
                if (!value.emAndamento) {
                  Future.delayed(const Duration(seconds: 2), () {
                    context.read<EstadoDoJogo>().retomarJogo();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InitialWidget()));
                  });
                }
                return Stack(
                  children: [
                    Positioned(top: 10, left: 10, child: ContadorDePontosWidget()),
                    Positioned(
                      top: 40,
                      left: 40,
                      child: SizedBox(
                        width: 700,
                        height: 300,
                        child: BonfireTiledWidget(
                          showCollisionArea: false,
                          joystick: Joystick(
                            keyboardConfig: KeyboardConfig(),
                            directional: JoystickDirectional(
                              margin: const EdgeInsets.only(left: 40, bottom: 150),
                            ),
                          ),
                          map: TiledWorldMap(
                            'pac_man_mapa.tmj',
                            objectsBuilder: {
                              'ponto': (p) => PontosNoChao(incrementadorDePontos: context.read<IncrementadorDePontos>(), position: p.position + Vector2(10, 10), player: context.read<PacMan>()),
                              'fantasmaVermelho': (p) => FantasmaVermelho(position: p.position, pacMan: context.read<PacMan>(), posicaoInicial: p.position),
                              'fruta': (p) => Fruta(position: p.position, pacMan: context.read<PacMan>()),
                              'fantasmaLaranja': (p) => FantasmaLaranja(position: p.position, pacMan: context.read<PacMan>(), posicaoInicial: p.position),
                              'fantasmaAzul': (p) => FantasmaAzul(position: p.position, pacMan: context.read<PacMan>(), posicaoInicial: p.position),
                              'fantasmaRosa': (p) => FantasmaRosa(position: p.position, pacMan: context.read<PacMan>(), posicaoInicial: p.position),
                            },
                          ),
                          player: context.watch<PacMan>().setPositon(Vector2(3.5 * 32, 2 * 16), context.read<EstadoDoJogo>()),
                          cameraConfig: CameraConfig(
                            zoom: 0.6,
                            target: AncoraCamera(position: Vector2(11.5 * 32, 22 * 16)),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      }
    );
  }
}
