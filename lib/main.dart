import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico_02_escribo/initial_widget.dart';
import 'components/estado_do_jogo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]).then((value) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: EstadoDoJogo()),
      ],
      child: const InitialWidget())));
}
