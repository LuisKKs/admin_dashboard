import 'dart:convert';

class CatCarrera {
  CatCarrera({
    required this.id,
    required this.typeName,
    required this.description,
  });

  Id id;
  String typeName;
  String description;

  factory CatCarrera.fromJson(String str) =>
      CatCarrera.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CatCarrera.fromMap(Map<String, dynamic> json) => CatCarrera(
      id: Id.fromMap(json["_id"]),
      typeName: json["typeName"],
      description: json["description"]);

  Map<String, dynamic> toMap() =>
      {"_id": id.toMap(), "typeName": typeName, "description": description};
}

class Id {
  Id({
    required this.oid,
  });

  String oid;

  factory Id.fromJson(String str) => Id.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Id.fromMap(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toMap() => {
        "\u0024oid": oid,
      };
}
