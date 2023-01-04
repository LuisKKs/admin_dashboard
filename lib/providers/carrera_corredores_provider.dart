import 'package:admin_dashboard/models/http/corredores_carrera_response.dart';
import 'package:flutter/cupertino.dart';
import '../api/eventos_api.dart';


class CarreraCorredoresProvider extends ChangeNotifier {
  List<CorredoresCarreraElement> corredores = [];

  getCarreras() async {
    final resp = await EventosApi.httpGet('/carrera-corredor');
    final coResp = CorredoresCarrera.fromMap(resp);

    this.corredores = [...coResp.corredoresCarrera];
    notifyListeners();
    return corredores;
    
  }
}
