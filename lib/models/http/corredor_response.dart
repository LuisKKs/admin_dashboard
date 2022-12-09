import 'dart:convert';

import '../corredor.dart';

class CorredoresResponse {
  CorredoresResponse({
    required this.total,
    required this.corredores,
  });

  int total;
  List<Corredore> corredores;

  factory CorredoresResponse.fromJson(String str) =>
      CorredoresResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CorredoresResponse.fromMap(Map<String, dynamic> json) =>
      CorredoresResponse(
        total: json["total"],
        corredores: List<Corredore>.from(
            json["corredores"].map((x) => Corredore.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "corredores": List<dynamic>.from(corredores.map((x) => x.toMap())),
      };
}
