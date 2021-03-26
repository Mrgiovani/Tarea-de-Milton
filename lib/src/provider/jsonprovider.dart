// Convertir un archivo json a una cadena de texto
import 'package:flutter/services.dart' show rootBundle;

// Convertir un string json a un map
import 'dart:convert';

class _JsonProvider {
  List<dynamic> datos; //se guarda cualquier cosa en los dynamic

  _JsonProvider() {
    datos = [];
    // load();
  }

  void load() {
    rootBundle.loadString('data/menu_options.json').then((data) {
      // print(data);
      Map jsonmap = jsonDecode(data); //cambio de cadena json a map
      print(jsonmap['rutas']);
      datos = jsonmap['rutas'];
    });
  }

  Future<List<dynamic>> reload() async {
    final raw = await rootBundle.loadString('data/menu_options.json');
    Map jsonmap = jsonDecode(raw); //cambio de cadena json a map
    print(jsonmap['rutas']);
    datos = jsonmap['rutas'];
    return datos;
  }
}

final jsonprovider = _JsonProvider();
