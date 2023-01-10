import 'dart:convert';

class Usuario {
  Usuario({
    required this.name,
    required this.lastname,
    required this.email,
    required this.phonenumber,
    required this.role,
    required this.status,
    required this.google,
    required this.uid,
    required this.img,
  });

  String name;
  String lastname;
  String email;
  String phonenumber;
  String role;
  bool status;
  bool google;
  String uid;
  String img;

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
        img: json["img"],
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
        "img": img,
        "uid": uid,
      };
}
