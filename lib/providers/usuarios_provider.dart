import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/http/usuarios_response.dart';
import '../models/usuarios.dart';

class UsuariosProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColIndex;

  UsuariosProvider() {
    this.getUsuarios();
  }

  getUsuarios() async {
    final resp = await EventosApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UsuariosResponse.fromMap(resp);
    this.usuarios = [...usersResp.usuarios];
    isLoading = false;
    notifyListeners();
  }

  Future<Usuario> getUserById(String uid) async {
    try {
      final resp = await EventosApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);
      return user;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void sort<T>(Comparable<T> Function(Usuario usuario) getField) {
    usuarios.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();
  }

  void refreshUser(Usuario newUser) {
    this.usuarios = this.usuarios.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();

    notifyListeners();
  }
}
