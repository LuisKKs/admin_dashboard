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

  Future updateTipCarr(
    String id,
    String typeName,
    String description,
  ) async {
    final data = {
      'id': id,
      'typeName': typeName,
      'description': description,
    };

    try {
      await EventosApi.put('/catcarrera/$id', data);
      this.racetypes = this.racetypes.map((racetype) {
        if (racetype.id != id) return racetype;
        racetype.typeName = typeName;
        return racetype;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar el Tipo de carrera';
    }
  }

  Future newTipoCerrera(String typeName, String description, String id) async {
    final data = {"typeName": typeName, "description": description, "id": id};

    try {
      final json = await EventosApi.post('/catcarrera', data);
      final newCatCarr = Racetype.fromMap(json);
      racetypes.add(newCatCarr);
      notifyListeners();
    } catch (e) {
      print('Error al crear el tipo de carrera');
    }
  }

  Future deleteEvento(
    String id,
  ) async {
    try {
      await EventosApi.delete('/catcarrera/$id', {});

      racetypes.removeWhere((evento) => evento.id == id);

      notifyListeners();
    } catch (e) {
      print('Error al actualizar el tipo de carrera');
      throw (e);
    }
  }
}
