
import 'dart:convert';

class CorredoresCarrera {
    CorredoresCarrera({
        required this.total,
        required this.corredoresCarrera,
    });

    int total;
    List<CorredoresCarrera> corredoresCarrera;

    factory CorredoresCarrera.fromJson(String str) => CorredoresCarrera.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CorredoresCarrera.fromMap(Map<String, dynamic> json) => CorredoresCarrera(
        total: json["total"],
        corredoresCarrera: List<CorredoresCarrera>.from(json["corredoresCarrera"].map((x) => CorredoresCarrera.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "corredoresCarrera": List<dynamic>.from(corredoresCarrera.map((x) => x.toMap())),
    };
}