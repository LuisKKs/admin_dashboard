import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/http/usuarios_response.dart';
import 'package:flutter/material.dart';

import '../models/usuarios.dart';

class UsuariosProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];
  bool isLoading = true;

  UsuariosProvider() {
    this.getUsuarios();
  }

  getUsuarios() async {
    final resp = await EventosApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UsuariosResponse.fromMap(resp);

    print(usersResp);
    this.usuarios = [...usersResp.usuarios];

    isLoading = false;

    notifyListeners();
  }
}











/*import 'package:flutter/cupertino.dart';

import '../api/eventos_api.dart';
import '../models/http/usuarios_response.dart';
import '../models/usuarios.dart';

class UsuariosProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];

  getUsuarios() async {
    final resp = await EventosApi.httpGet('/usuarios');
    final usuariosResp = UsuariosResponse.fromMap(resp);

    this.usuarios = [...usuariosResp.usuarios];

    notifyListeners();
  }

  Future newUsuario(String phonenumber, bool status, bool google, String name,
      String lastname, String email, String role, String uid) async {
    final data = {
      "phonenumber": phonenumber,
      "status": status,
      "google": google,
      "name": name,
      "lastname": lastname,
      "email": email,
      "role": role,
      "uid": uid
    };

    try {
      final json = await EventosApi.post('/usuarios', data);
      final newUsuario = Usuario.fromMap(json);

      usuarios.add(newUsuario);
      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al crear evento');
    }
  }
}
*/