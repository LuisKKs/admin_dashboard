import 'dart:convert';

class Categorias {
    Categorias({
        required this.id,
        required this.raceType,
        required this.categoryName,
        required this.branch,
        required this.description,
    });

    String id;
    RaceType raceType;
    String categoryName;
    String branch;
    String description;

    factory Categorias.fromJson(String str) => Categorias.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Categorias.fromMap(Map<String, dynamic> json) => Categorias(
        id: json["_id"],
        raceType: RaceType.fromMap(json["raceType"]),
        categoryName: json["categoryName"],
        branch: json["branch"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "raceType": raceType.toMap(),
        "categoryName": categoryName,
        "branch": branch,
        "description": description,
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
