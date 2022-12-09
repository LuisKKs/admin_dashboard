import 'dart:convert';

class Carrera {
  Carrera({
    required this.event,
    required this.shortName,
    required this.longName,
    required this.raceDate,
    required this.raceHour,
    required this.responsable,
    required this.email,
    required this.contactNumber,
    required this.state,
    required this.municipality,
    required this.location,
    required this.latitude,
    required this.altitude,
    required this.raceLink,
  });

  Event event;
  String shortName;
  String longName;
  DateTime raceDate;
  String raceHour;
  String responsable;
  String email;
  String contactNumber;
  String state;
  String municipality;
  String location;
  String latitude;
  String altitude;
  String raceLink;

  factory Carrera.fromJson(String str) => Carrera.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Carrera.fromMap(Map<String, dynamic> json) => Carrera(
        event: Event.fromMap(json["event"]),
        shortName: json["shortName"],
        longName: json["longName"],
        raceDate: DateTime.parse(json["raceDate"]),
        raceHour: json["raceHour"],
        responsable: json["responsable"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        state: json["state"],
        municipality: json["municipality"],
        location: json["location"],
        latitude: json["latitude"],
        altitude: json["altitude"],
        raceLink: json["raceLink"],
      );

  Map<String, dynamic> toMap() => {
        "event": event.toMap(),
        "shortName": shortName,
        "longName": longName,
        "raceDate": raceDate.toIso8601String(),
        "raceHour": raceHour,
        "responsable": responsable,
        "email": email,
        "contactNumber": contactNumber,
        "state": state,
        "municipality": municipality,
        "location": location,
        "latitude": latitude,
        "altitude": altitude,
        "raceLink": raceLink,
      };
}

class Event {
  Event({
    required this.id,
    required this.eventName,
  });

  String id;
  String eventName;

  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        id: json["_id"],
        eventName: json["eventName"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "eventName": eventName,
      };
}
