import 'dart:convert';
import '../categorias.dart';

class Categoria {
    Categoria({
        required this.total,
        required this.categorias,
    });

    int total;
    List<Categorias> categorias;

    factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        total: json["total"],
        categorias: List<Categorias>.from(json["categorias"].map((x) => Categorias.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toMap())),
    };
}


