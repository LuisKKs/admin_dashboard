import 'dart:convert';

class Corredore {
  Corredore({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.lastname,
    required this.lastname2,
    required this.sex,
    required this.birthDate,
    required this.licence,
    required this.team,
    required this.country,
    required this.state,
    required this.municipality,
    required this.runnerNumber,
    required this.img,
    required this.emergencyNumber,
    required this.emergencyName,
  });

  String id;
  String email;
  String phoneNumber;
  String name;
  String lastname;
  String lastname2;
  String sex;
  DateTime birthDate;
  String licence;
  String team;
  String country;
  String state;
  String municipality;
  String runnerNumber;
  String img;
  String emergencyNumber;
  String emergencyName;

  factory Corredore.fromJson(String str) => Corredore.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Corredore.fromMap(Map<String, dynamic> json) => Corredore(
        id: json["_id"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        lastname: json["lastname"],
        lastname2: json["lastname2"],
        sex: json["sex"],
        birthDate: DateTime.parse(json["birthDate"]),
        licence: json["licence"],
        team: json["team"],
        country: json["country"],
        state: json["state"],
        municipality: json["municipality"],
        runnerNumber: json["runnerNumber"],
        img: json["img"],
        emergencyNumber: json["emergencyNumber"],
        emergencyName: json["emergencyName"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "email": email,
        "phoneNumber": phoneNumber,
        "name": name,
        "lastname": lastname,
        "lastname2": lastname2,
        "sex": sex,
        "birthDate": birthDate.toIso8601String(),
        "licence": licence,
        "team": team,
        "country": country,
        "state": state,
        "municipality": municipality,
        "runnerNumber": runnerNumber,
        "img": img,
        "emergencyNumber": emergencyNumber,
        "emergencyName": emergencyName,
      };
}
