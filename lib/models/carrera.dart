import 'dart:convert';

class Racetype {
  Racetype({
    required this.typeName,
    required this.description,
    required this.user,
    required this.uid,
  });

  String typeName;
  String description;
  User user;
  String uid;

  factory Racetype.fromJson(String str) => Racetype.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Racetype.fromMap(Map<String, dynamic> json) => Racetype(
        typeName: json["typeName"],
        description: json["description"],
        user: User.fromMap(json["user"]),
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "typeName": typeName,
        "description": description,
        "user": user.toMap(),
        "uid": uid,
      };
}

class User {
  User({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
      };
}
