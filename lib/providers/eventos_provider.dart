import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/evento.dart';
import 'package:admin_dashboard/models/http/eventos_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventosProvider extends ChangeNotifier {
  List<Evento> eventos = [];

  getEventos() async {
    final resp = await EventosApi.httpGet('/evento');
    final eventosResp = EventosResponse.fromMap(resp);

    this.eventos = [...eventosResp.eventos];

    print(this.eventos);

    notifyListeners();
  }

  Future newEvento(
      String phone,
      String shortName,
      String eventName,
      DateTime dateStart,
      DateTime dateFinish,
      String eventHour,
      String? logo,
      String organizer,
      String email,
      String? website,
      String country,
      String stateCountry,
      String raceType) async {
    final data = {
      'raceType': raceType,
      'phone': phone,
      'shortName': shortName,
      'eventName': eventName,
      'dateStart': dateStart,
      'dateFinish': dateFinish,
      'eventHour': eventHour,
      'organizer': organizer,
      'email': email,
      'country': country
    };

    try {
      final json = await EventosApi.post('/evento', data);
      final newEvento = Evento.fromMap(json);

      eventos.add(newEvento);
      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al crear evento');
    }
  }
}
