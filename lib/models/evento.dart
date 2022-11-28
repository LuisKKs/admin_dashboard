import 'dart:convert';

class Evento {
  Evento({
    required this.logo,
    required this.website,
    required this.country,
    required this.stateCountry,
    required this.raceType,
    required this.shortName,
    required this.eventName,
    required this.dateStart,
    required this.dateFinish,
    required this.eventHour,
    required this.organizer,
    required this.email,
    required this.phone,
  });

  String logo;
  String website;
  String country;
  String stateCountry;
  RaceType raceType;
  String shortName;
  String eventName;
  DateTime dateStart;
  DateTime dateFinish;
  String eventHour;
  String organizer;
  String email;
  String phone;

  factory Evento.fromJson(String str) => Evento.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Evento.fromMap(Map<String, dynamic> json) => Evento(
        logo: json["logo"],
        website: json["website"],
        country: json["country"],
        stateCountry: json["stateCountry"],
        raceType: RaceType.fromMap(json["raceType"]),
        shortName: json["shortName"],
        eventName: json["eventName"],
        dateStart: DateTime.parse(json["dateStart"]),
        dateFinish: DateTime.parse(json["dateFinish"]),
        eventHour: json["eventHour"],
        organizer: json["organizer"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "logo": logo,
        "website": website,
        "country": country,
        "stateCountry": stateCountry,
        "raceType": raceType.toMap(),
        "shortName": shortName,
        "eventName": eventName,
        "dateStart": dateStart.toIso8601String(),
        "dateFinish": dateFinish.toIso8601String(),
        "eventHour": eventHour,
        "organizer": organizer,
        "email": email,
        "phone": phone,
      };

  @override
  String toString() {
    return 'Evento: ${this.shortName} ';
  }
}

class RaceType {
  RaceType({
    required this.id,
    required this.typeName,
  });

  String id;
  String typeName;

  factory RaceType.fromJson(String str) => RaceType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RaceType.fromMap(Map<String, dynamic> json) => RaceType(
        id: json["_id"],
        typeName: json["typeName"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "typeName": typeName,
      };
}
