import 'package:admin_dashboard/api/EventosApi.dart';
import 'package:admin_dashboard/models/http/auth_reponse.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {"correo": email, "password": password};

    EventosApi.post('/auth/login', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      EventosApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      print('error en :$e');
      NotificationsService.showSnackbarError('Usuario / Password no validos');
    });
  }

  register(String email, String password, String name) {
    //todo: peticion http
    final data = {"nombre": name, "correo": email, "password": password};

    EventosApi.post('/usuarios', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      EventosApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      print('error en :$e');
      NotificationsService.showSnackbarError('Usuario / Password no validos');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //todo ir al backend y comprobar si eljwt es valido

    try {
      final resp = await EventosApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);

      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
