import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/carrera.dart';
import 'package:admin_dashboard/models/http/tipo_carrera_response.dart';

class CatCarreraProvider extends ChangeNotifier {
  List<CatCarrera> categorias = [];

  getCatCarrera() async {
    final resp = await EventosApi.httpGet('/catcarrera');
    final catcarr = TipoCarreraResponse.fromMap(resp);

    this.categorias = [...catcarr.racetypes];

    print(this.categorias);

    notifyListeners();
  }

  Future newEvento(Id id, String typeName, String description, Id user,
      bool status, int v) async {
    final data = {
      "_id": id.toMap(),
      "typeName": typeName,
      "description": description,
      "user": user.toMap(),
      "status": status,
      "__v": v,
    };

    try {
      final json = await EventosApi.post('/catcarrera', data);
      final newCatCarr = CatCarrera.fromMap(json);
      categorias.add(newCatCarr);
      notifyListeners();
    } catch (e) {
      print('Error al crear evento');
    }
  }
}
