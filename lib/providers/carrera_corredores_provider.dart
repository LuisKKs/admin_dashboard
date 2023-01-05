import 'package:flutter/cupertino.dart';
import '../api/eventos_api.dart';
import '../models/http/corredores_carrera_id_response.dart';
import '../models/http/corredores_carrera_response.dart';


class CarreraCorredoresProvider extends ChangeNotifier {
  List<CorredoresCarreraElement> corredores = [];
  List<List<Result>> cocar= [];
  CarreraCorredoresProvider(){
    getCarreras();
  }
  getCarreras() async {
    final resp = await EventosApi.httpGet("/carrera-corredor");
    final coResp = CorredoresCarrera.fromMap(resp);
    this.corredores = [...coResp.corredoresCarrera];
    notifyListeners();
    
  }
  getCarrerasId(String id) async {
    try {
      final resp = await EventosApi.httpGet('/carrera-corredor/$id');
      final cocaresp = CorredoresCarreraId.fromMap(resp);
      return cocar = [...cocaresp.results];
    } catch (e) {
      throw e;
    }
  }
  Future updateCarrCorr(
    String id,
    String race,
    String runner,
  ) async {
    final data = {
      'race': race,
      'runner': runner,
    };

    try {
      await EventosApi.put('/carrera-corredor/$id', data);
      this.cocar = this.cocar.map((racetype) {
        if (cocar.single.single.id != id) return cocar.single;
        cocar.single.single.race.longName = race;
        return racetype;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar la carrera del corredor';
    }
  }
  deleteCarreraCorredor(id)async {
    try {
      await EventosApi.delete('/carrera-corredor/$id', {});

      cocar.removeWhere((carrera) => carrera.single.id == id);

      notifyListeners();
    } catch (e) {
      print('Error al borrar carrera');
      throw (e);
    }
  }
}
