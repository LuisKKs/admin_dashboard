import 'package:flutter/material.dart';
import '../api/eventos_api.dart';
import '../models/http/corredores_carrera_id_response.dart';
import '../models/http/corredores_carrera_response.dart';
import '../ui/views/carrera_corredores_view.dart';

class CarreraCorredoresProvider extends ChangeNotifier {
  List<CorredoresCarrera> corredores = [];
  List<List<Result>> cocar = [];
  bool ascending = true;
  int? sortColIndex;

  CarreraCorredoresProvider() {
    getCarreras();
  }
  getCarreras() async {
    final resp = await EventosApi.httpGet("/carrera-corredor");
    final coResp = CorredoresCarreraResponse.fromMap(resp);
    this.corredores = [...coResp.corredoresCarrera];
    notifyListeners();
  }

  getCarrerasId(String id) async {
    try {
      final resp = await EventosApi.httpGet('/carrera-corredor/$id');
      final cocaresp = CorredoresCarreraIdResponse.fromMap(resp);
      notifyListeners();
      return cocar = [...cocaresp.results];
    } catch (e) {
      throw e;
    }
  }

  Future updateCarrCorr(
      {required String id, String? race, String? status}) async {
    final data = {'race': race, 'preRegistration': status};
    try {
      await EventosApi.put('/carrera-corredor/$id', data);
      this.cocar = this.cocar.map((racetype) {
        if (cocar.single.single.id != id) return cocar.single;
        cocar.single.single.race.longName = race!;
        return racetype;
      }).toList();
      notifyListeners();
    } catch (e) {
      return CarreraCorredoresView(id: id);
      throw 'Error al actualizar la carrera del corredor';
    }
  }

  deleteCarreraCorredor(id) async {
    try {
      await EventosApi.delete('/carrera-corredor/$id', {});
      cocar.removeWhere((carrera) => carrera.single.id == id);
      notifyListeners();
    } catch (e) {
      print('Error al borrar carrera');
      throw (e);
    }
  }

  void sort<T>(
      Comparable<T> Function(CorredoresCarrera corredoresCarrera) getField) {
    corredores.sort((a, b) {
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
