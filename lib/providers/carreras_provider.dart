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
      //String id,
      String event,
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
      //"id": id,
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

  Future updateCarrera(
      String id,
      String shortName,
      String longName,
      DateTime raceDate,
      String raceHour,
      String? responsable,
      String contactNumber,
      String event,
      String? raceLink,
      String email,
      String? location,
      String altitude,
      String latitude,
      String municipality,
      String state) async {
    final data = {
      'id': id,
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
      await EventosApi.put('/carrera/$id', data);
      this.carreras = this.carreras.map((carerra) {
        if (carerra.id != id) return carerra;
        carerra.longName = longName;
        return carerra;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar la carrera';
    }
  }

  Future deleteCarrera(
    String id,
  ) async {
    try {
      await EventosApi.delete('/carrera/$id', {});

      carreras.removeWhere((carrera) => carrera.id == id);

      notifyListeners();
    } catch (e) {
      print('Error al actualizar evento');
      throw (e);
    }
  }
}
