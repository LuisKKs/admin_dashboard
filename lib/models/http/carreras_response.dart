import 'dart:convert';

import '../carrerasprin.dart';

class CarrerasResponse {
  CarrerasResponse({
    required this.total,
    required this.carreras,
  });

  int total;
  List<Carrera> carreras;

  factory CarrerasResponse.fromJson(String str) =>
      CarrerasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarrerasResponse.fromMap(Map<String, dynamic> json) =>
      CarrerasResponse(
        total: json["total"],
        carreras:
            List<Carrera>.from(json["carreras"].map((x) => Carrera.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "carreras": List<dynamic>.from(carreras.map((x) => x.toMap())),
      };
}
