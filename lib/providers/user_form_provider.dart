import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/models/usuarios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  //todo

  /* @override
  void updateListeners() {
    notifyListeners();
  }*/

  copyUserWith({
    String? name,
    String? lastname,
    String? email,
    String? phonenumber,
    String? role,
    bool? status,
    bool? google,
    String? uid,
    String? img,
  }) {
    user = Usuario(
      name: name ?? user!.name,
      lastname: lastname ?? this.user!.lastname,
      email: email ?? this.user!.email,
      phonenumber: phonenumber ?? this.user!.phonenumber,
      role: role ?? this.user!.role,
      status: status ?? this.user!.status,
      google: google ?? this.user!.google,
      uid: uid ?? this.user!.uid,
      img: img ?? this.user!.img,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future upDateUser() async {
    if (!this._validForm()) return false;

    final data = {
      'name': user!.name,
      'lastname': user!.lastname,
      'email': user!.email,
      'phonenumber': user!.phonenumber,
      'role': user!.role,
    };
    try {
      final resp = await EventosApi.put('/usuarios/${user!.uid}', data);
      print(resp);
      return true;
    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }
  }

  Future<Usuario> uploadImage(String path, Uint8List bytes) async {
    try {
      final resp = await EventosApi.uploadFile(path, bytes);
      user = Usuario.fromMap(resp);
      notifyListeners();
      return user!;
    } catch (e) {
      print(e);
      throw 'Error en user from provider';
    }
  }
}
