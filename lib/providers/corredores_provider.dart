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
      //int runnerNumber,
      String runnerNumber,
      String email,
      String country,
      String state,
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
      'state': state,
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
      print('Error al crear corredor');
    }
  }

  Future updateCorredor(
    String id,
    String email,
    String phoneNumber,
    String name,
    String lastname,
    String lastname2,
    String sex,
    DateTime birthDate,
    String licence,
    String team,
    String country,
    String state,
    String municipality,
    //int runnerNumber,
    String runnerNumber,
    String picture,
    String emergencyNumber,
    String emergencyName,
  ) async {
    final data = {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'name': name,
      'lastname': lastname,
      'lastname2': lastname2,
      'sex': sex,
      'birthDate': birthDate,
      'licence': licence,
      'team': team,
      'country': country,
      'state': state,
      'municipality': municipality,
      'runnerNumber': runnerNumber,
      'picture': picture,
      'emergencyNumber': emergencyNumber,
      'emergencyName': emergencyName,
    };

    try {
      await EventosApi.put('/corredor/$id', data);
      this.corredores = this.corredores.map((corredor) {
        if (corredor.id != id) return corredor;
        corredor.name = name;
        return corredor;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar el corredor';
    }
  }

  Future deleteCorredor(
    String id,
  ) async {
    try {
      await EventosApi.delete('/corredor/$id', {});

      corredores.removeWhere((corredor) => corredor.id == id);

      notifyListeners();
    } catch (e) {
      print('Error al eliminar corredor');
      throw (e);
    }
  }
}
