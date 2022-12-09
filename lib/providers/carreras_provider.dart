import 'package:flutter/cupertino.dart';

import '../api/eventos_api.dart';
import '../models/carrerasprin.dart';
import '../models/http/carreras_response.dart';

class CarrerasProvider extends ChangeNotifier {
  List<Carrera> carreras = [];

  getCarreras() async {
    final resp = await EventosApi.httpGet('/carrera');
    final carreraResp = CarrerasResponse.fromMap(resp);

    this.carreras = [...carreraResp.carreras];

    notifyListeners();
  }

  Future newCarrera(
      Event event,
      String shortName,
      String longName,
      DateTime raceDate,
      String raceHour,
      String responsable,
      String email,
      String contactNumber,
      String state,
      String municipality,
      String location,
      String latitude,
      String altitude,
      String raceLink) async {
    final data = {
      "event": event,
      "shortName": shortName,
      "longName": longName,
      "raceDate": raceDate,
      "raceHour": raceHour,
      "responsable": responsable,
      "email": email,
      "contactNumber": contactNumber,
      "state": state,
      "municipality": municipality,
      "location": location,
      "latitude": latitude,
      "altitude": altitude,
      "raceLink": raceLink,
    };

    try {
      final json = await EventosApi.post('/corredor', data);
      final newCarrera = Carrera.fromMap(json);

      carreras.add(newCarrera);
      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al crear evento');
    }
  }
}
