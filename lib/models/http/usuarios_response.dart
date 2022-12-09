import 'dart:convert';

import '../usuarios.dart';

class UsuariosResponse {
  UsuariosResponse({
    required this.total,
    required this.usuarios,
  });

  int total;
  List<Usuario> usuarios;

  factory UsuariosResponse.fromJson(String str) =>
      UsuariosResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuariosResponse.fromMap(Map<String, dynamic> json) =>
      UsuariosResponse(
        total: json["total"],
        usuarios:
            List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
      };
}
