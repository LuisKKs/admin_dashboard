import 'package:admin_dashboard/api/CarrerasApi.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    //todo: peticion http
    this._token = 'dqwedwdewdewded.dewddwe.dewdwe';
    LocalStorage.prefs.setString('token', this._token!);

    //todo : navegar a la siguiente vista
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String name) {
    //todo: peticion http
    final data = {"nombre": name, "correo": email, "password": password};

    CarrerasApi.post('/usuarios', data).then((json) {
      print(json);
    }).catchError((e) {
      print('error en :$e');
    });

    //todo : navegar a la siguiente vista
    /* authStatus = AuthStatus.authenticated;
    LocalStorage.prefs.setString('token', this._token!);
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
    notifyListeners();
    */
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //todo ir al backend y comprobar si eljwt es valido

    await Future.delayed(Duration(microseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
