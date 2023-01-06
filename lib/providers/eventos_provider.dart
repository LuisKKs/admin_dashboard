import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/evento.dart';
import 'package:admin_dashboard/models/http/eventos_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventosProvider extends ChangeNotifier {
  List<Evento> eventos = [];
  bool ascending = true;
  int? sortColIndex;
  getEventos() async {
    final resp = await EventosApi.httpGet('/evento');
    final eventosResp = EventosResponse.fromMap(resp);
    this.eventos = [...eventosResp.eventos];
    print(eventosResp);
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
      'country': country,
      'website': website,
      'stateCountry': stateCountry
    };

    try {
      final json = await EventosApi.post('/evento', data);
      final newEvento = Evento.fromMap(json);

      eventos.add(newEvento);
      notifyListeners();
    } catch (e) {
      throw 'Error al crear la categoria';
    }
  }

  Future updateEvento(
      String id,
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
      String? stateCountry,
      String raceType) async {
    final data = {
      'id': id,
      'raceType': raceType,
      'phone': phone,
      'shortName': shortName,
      'eventName': eventName,
      'dateStart': dateStart,
      'dateFinish': dateFinish,
      'eventHour': eventHour,
      'organizer': organizer,
      'email': email,
      'country': country,
      'website': website,
      'stateCountry': stateCountry
    };

    try {
      await EventosApi.put('/evento/$id', data);
      this.eventos = this.eventos.map((evento) {
        if (evento.id != id) return evento;
        evento.eventName = eventName;
        return evento;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar la categoria';
    }
  }

  Future deleteEvento(
    String id,
  ) async {
    try {
      await EventosApi.delete('/evento/$id', {});

      eventos.removeWhere((evento) => evento.id == id);

      notifyListeners();
    } catch (e) {
      print('Error al actualizar evento');
      throw (e);
    }
  }

  void sort<T>(Comparable<T> Function(Evento evento) getField) {
    eventos.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();
  }
}
