import 'package:flutter/material.dart';

class EstadoDoJogo extends ChangeNotifier {
  bool emAndamento = true;
  void retomarJogo (){
    emAndamento = true;
    notifyListeners();
  }
  void finalizarJogo() {
    emAndamento = false;
    notifyListeners();
  }
}
