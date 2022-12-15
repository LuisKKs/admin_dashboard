import 'dart:convert';

import '../evento.dart';

class EventosResponse {
  EventosResponse({
    required this.total,
    required this.eventos,
  });

  int total;
  List<Evento> eventos;

  factory EventosResponse.fromJson(String str) =>
      EventosResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventosResponse.fromMap(Map<String, dynamic> json) => EventosResponse(
        total: json["total"],
        eventos:
            List<Evento>.from(json["eventos"].map((x) => Evento.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "eventos": List<dynamic>.from(eventos.map((x) => x.toMap())),
      };
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
