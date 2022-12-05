import 'dart:convert';

import '../carrera.dart';

class TipoCarreraResponse {
  TipoCarreraResponse({
    required this.total,
    required this.racetypes,
  });

  int total;
  List<Racetype> racetypes;

  factory TipoCarreraResponse.fromJson(String str) =>
      TipoCarreraResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoCarreraResponse.fromMap(Map<String, dynamic> json) =>
      TipoCarreraResponse(
        total: json["total"],
        racetypes: List<Racetype>.from(
            json["racetypes"].map((x) => Racetype.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "racetypes": List<dynamic>.from(racetypes.map((x) => x.toMap())),
      };
}
