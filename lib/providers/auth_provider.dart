import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    //todo: peticion http
    this._token = 'dqwedwdewdewded.dewddwe.dewdwe';
    LocalStorage.prefs.setString('token', this._token!);

    //todo : navegar a la siguiente vista
    notifyListeners();
  }
}
