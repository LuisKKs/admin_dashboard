import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventosProvider extends ChangeNotifier {
  List eventos = [];

  getEventos() async {
    final resp = await EventosApi.httpGet('/categorias');
    print(resp);

    notifyListeners();
  }
}
