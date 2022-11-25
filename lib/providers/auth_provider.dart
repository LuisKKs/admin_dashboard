import 'package:flutter/material.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/models/http/auth_reponse.dart';
import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {'email': email, 'password': password};

    EventosApi.post('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      EventosApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackbarError('Usuario / Password no validos');
    });
  }

  register(String email, String password, String name, String lastname,
      String phonenumber) {
    final data = {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'phonenumber': phonenumber,
    };
    EventosApi.post('/usuarios', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      EventosApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackbarError('Error al Registrar');
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
