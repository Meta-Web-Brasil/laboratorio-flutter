import 'dart:collection';

import 'package:aula_01/models/signo.dart';
import 'package:flutter/material.dart';

class FavoritasRepository extends ChangeNotifier {
  // Lista privada com tipos Signo
  List<Signo> _lista = [];

  // UnmodifiableListView<Signo> get lista => UnmodifiableListView(_lista);
  List<Signo> get lista => _lista;

  saveAll(List<Signo> signos) {
    signos.forEach((signo) {
      if (!_lista.contains(signo)) {
        _lista.add(signo);
      }
    });

    notifyListeners();
  }

  remover(Signo signo) {
    _lista.remove(signo);
    notifyListeners();
  }
}
