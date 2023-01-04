import 'dart:convert';
import 'http/corredores_carrera_response.dart';

class CorredoresCarrera {
    CorredoresCarrera({
        required this.total,
        required this.corredoresCarrera,
    });
    int total;
    List<CorredoresCarreraElement> corredoresCarrera;
    factory CorredoresCarrera.fromJson(String str) => CorredoresCarrera.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());
    factory CorredoresCarrera.fromMap(Map<String, dynamic> json) => CorredoresCarrera(
        total: json["total"],
        corredoresCarrera: List<CorredoresCarreraElement>.from(json["corredoresCarrera"].map((x) => CorredoresCarreraElement.fromMap(x))),
    );
    Map<String, dynamic> toMap() => {
        "total": total,
        "corredoresCarrera": List<dynamic>.from(corredoresCarrera.map((x) => x.toMap())),
    };
}