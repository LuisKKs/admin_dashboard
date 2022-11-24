import 'dart:convert';

class AuthResponse {
  AuthResponse({
    required this.usuario,
    required this.token,
  });

  Usuario usuario;
  String token;

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
      };
}

class Usuario {
  Usuario({
    required this.name,
    required this.lastname,
    required this.email,
    this.phonenumber,
    this.role,
    this.status,
    this.google,
    required this.uid,
  });

  String name;
  String lastname;
  String email;
  String? phonenumber;
  String? role;
  bool? status;
  bool? google;
  String uid;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        role: json["role"],
        status: json["status"],
        google: json["google"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "lastname": lastname,
        "email": email,
        "phonenumber": phonenumber,
        "role": role,
        "status": status,
        "google": google,
        "uid": uid,
      };
}
