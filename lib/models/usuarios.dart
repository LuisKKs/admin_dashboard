import 'dart:convert';

class Usuario {
  Usuario({
    required this.phonenumber,
    required this.status,
    required this.google,
    required this.name,
    required this.lastname,
    required this.email,
    required this.role,
    required this.uid,
  });

  String phonenumber;
  bool status;
  bool google;
  String name;
  String lastname;
  String email;
  String role;
  String uid;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        phonenumber: json["phonenumber"],
        status: json["status"],
        google: json["google"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        role: json["role"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "phonenumber": phonenumber,
        "status": status,
        "google": google,
        "name": name,
        "lastname": lastname,
        "email": email,
        "role": role,
        "uid": uid,
      };
}
