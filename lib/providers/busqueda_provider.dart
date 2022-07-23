import 'package:flutter/cupertino.dart';

class BuscadorProvider with ChangeNotifier {
  final List<String> _listaBusquedaOriginal =
      List<String>.generate(10000, (i) => "Item $i");

  List<String> _listaBusqueda = List<String>.generate(10000, (i) => "Item $i");
  List<String> get getListaBusqueda => _listaBusqueda;

  String _busqueda = '';
  String get getBusqueda => _busqueda;
  set setBusqueda(String value) {
    List<String> dummyListData = [];

    _busqueda = value;

    if (value == '') {
      _listaBusqueda.clear();
      _listaBusqueda = getNuevaInstanciaListOriginal(_listaBusquedaOriginal);
    } else {
      _listaBusquedaOriginal.forEach((item) {
        if (item.contains(value)) {
          dummyListData.add(item);
        }
      });
      _listaBusqueda.clear();
      _listaBusqueda.addAll(dummyListData);
    }

    notifyListeners();
  }

  void filtrarResultados({required String palabra}) {
    List<String> dummyListData = [];
  }
}

List<String> getNuevaInstanciaListOriginal(List<String> lista) {
  return List<String>.from(lista);
}
