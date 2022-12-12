import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/carrera.dart';
import '../models/http/tipo_carrera_response.dart';

class CatCarreraProvider extends ChangeNotifier {
  List<Racetype> racetypes = [];

  getCatCarrera() async {
    final resp = await EventosApi.httpGet('/catcarrera');
    final catcarr = TipoCarreraResponse.fromMap(resp);
    racetypes = [...catcarr.racetypes];
    notifyListeners();
  }

  Future newTipCerrera(String typeName, String description, String id) async {
    final data = {"typeName": typeName, "description": description, "id": id};

    try {
      final json = await EventosApi.post('/catcarrera', data);
      final newCatCarr = Racetype.fromMap(json);
      racetypes.add(newCatCarr);
      notifyListeners();
    } catch (e) {
      print('Error al crear evento');
    }
  }
}
