import 'dart:convert';

class Corredore {
  Corredore({
    required this.licence,
    required this.team,
    required this.runnerNumber,
    required this.picture,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.name,
    required this.lastname,
    required this.lastname2,
    required this.sex,
    required this.birthDate,
    required this.country,
    required this.state,
    required this.municipality,
    required this.emergencyNumber,
    required this.emergencyName,
  });

  String licence;
  String team;
  int runnerNumber;
  String picture;
  String email;
  String password;
  String phoneNumber;
  String name;
  String lastname;
  String lastname2;
  String sex;
  DateTime birthDate;
  String country;
  String state;
  String municipality;
  String emergencyNumber;
  String emergencyName;

  factory Corredore.fromJson(String str) => Corredore.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Corredore.fromMap(Map<String, dynamic> json) => Corredore(
        licence: json["licence"],
        team: json["team"],
        runnerNumber: json["runnerNumber"],
        picture: json["picture"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        lastname: json["lastname"],
        lastname2: json["lastname2"],
        sex: json["sex"],
        birthDate: DateTime.parse(json["birthDate"]),
        country: json["country"],
        state: json["state"],
        municipality: json["municipality"],
        emergencyNumber: json["emergencyNumber"],
        emergencyName: json["emergencyName"],
      );

  Map<String, dynamic> toMap() => {
        "licence": licence,
        "team": team,
        "runnerNumber": runnerNumber,
        "picture": picture,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "name": name,
        "lastname": lastname,
        "lastname2": lastname2,
        "sex": sex,
        "birthDate": birthDate.toIso8601String(),
        "country": country,
        "state": state,
        "municipality": municipality,
        "emergencyNumber": emergencyNumber,
        "emergencyName": emergencyName,
      };
}
