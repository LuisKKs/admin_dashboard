import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/carrera.dart';
import 'package:admin_dashboard/models/http/tipo_carrera_response.dart';

class CatCarreraProvider extends ChangeNotifier {
  List<Racetype> categorias = [];
  getCatCarrera() async {
    final resp = await EventosApi.httpGet('/catcarrera');
    final catcarr = TipoCarreraResponse.fromMap(resp);
    categorias = [...catcarr.racetypes];
    notifyListeners();
  }

  Future newEvento(Id id, String typeName, String description) async {
    final data = {
      "_id": id.toMap(),
      "typeName": typeName,
      "description": description,
    };

    try {
      final json = await EventosApi.post('/catcarrera', data);
      final newCatCarr = Racetype.fromMap(json);
      categorias.add(newCatCarr);
      notifyListeners();
    } catch (e) {
      print('Error al crear evento');
    }
  }
}
