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
}
