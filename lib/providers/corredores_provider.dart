import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/corredor.dart';
import 'package:flutter/cupertino.dart';

import '../models/http/corredor_response.dart';

class CorredoresProvider extends ChangeNotifier {
  List<Corredore> corredores = [];

  getCorredores() async {
    final resp = await EventosApi.httpGet('/corredor');
    final corredorResp = CorredoresResponse.fromMap(resp);

    this.corredores = [...corredorResp.corredores];

    notifyListeners();
  }

  Future newCorredor(
      String name,
      String lastname,
      String lastname2,
      int runnerNumber,
      String email,
      String country,
      String emergencyName,
      String emergencyNumber,
      String? licence,
      String municipality,
      String phoneNumber,
      DateTime birthDate,
      String picture,
      String sex,
      String team) async {
    final data = {
      'name': name,
      'lastname': lastname,
      'lastname2': lastname2,
      'runnerNumber': runnerNumber,
      'email': email,
      'country': country,
      'emergencyName': emergencyName,
      'emergencyNumber': emergencyNumber,
      'licence': licence,
      'municipality': municipality,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
      'picture': picture,
      'sex': sex,
      'team': team
    };

    try {
      final json = await EventosApi.post('/corredor', data);
      final newCorredor = Corredore.fromMap(json);

      corredores.add(newCorredor);
      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al crear evento');
    }
  }
}
