import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/carrera.dart';
import 'package:admin_dashboard/ui/modals/evento_modal.dart';
import '../models/http/tipo_carrera_response.dart';

class CatCarreraProvider extends ChangeNotifier {
  List<Racetype> racetypes = [];

  getCatCarrera() async {
    final resp = await EventosApi.httpGet('/catcarrera');
    final catcarr = TipoCarreraResponse.fromMap(resp);
    racetypes = [...catcarr.racetypes];
    //ReisTayp reis = ReisTayp();
    //reis.setRacetypes(racetypes);
    //var racetypeI = racetypes.iterator;
    /*while (racetypeI.moveNext()) {
      print(racetypeI.current.typeName);
    }
    */
    notifyListeners();
    //return racetypeI;
  }

  Future newEvento(String typeName, String description) async {
    final data = {
      "typeName": typeName,
      "description": description,
    };

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
