import 'dart:convert';
import 'http/eventos_response.dart';

class Evento {
  Evento({
    required this.id,
    required this.raceType,
    required this.shortName,
    required this.eventName,
    required this.dateStart,
    required this.dateFinish,
    required this.eventHour,
    required this.logo,
    required this.organizer,
    required this.email,
    required this.phone,
    required this.website,
    required this.country,
    required this.stateCountry,
  });

  String id;
  RaceType raceType;
  String shortName;
  String eventName;
  DateTime dateStart;
  DateTime dateFinish;
  String eventHour;
  String logo;
  String organizer;
  String email;
  String phone;
  String website;
  String country;
  String stateCountry;

  factory Evento.fromJson(String str) => Evento.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Evento.fromMap(Map<String, dynamic> json) => Evento(
        id: json["_id"],
        raceType: RaceType.fromMap(json["raceType"]),
        shortName: json["shortName"],
        eventName: json["eventName"],
        dateStart: DateTime.parse(json["dateStart"]),
        dateFinish: DateTime.parse(json["dateFinish"]),
        eventHour: json["eventHour"],
        logo: json["logo"],
        organizer: json["organizer"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
        country: json["country"],
        stateCountry: json["stateCountry"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "raceType": raceType.toMap(),
        "shortName": shortName,
        "eventName": eventName,
        "dateStart": dateStart.toIso8601String(),
        "dateFinish": dateFinish.toIso8601String(),
        "eventHour": eventHour,
        "logo": logo,
        "organizer": organizer,
        "email": email,
        "phone": phone,
        "website": website,
        "country": country,
        "stateCountry": stateCountry,
      };
}
