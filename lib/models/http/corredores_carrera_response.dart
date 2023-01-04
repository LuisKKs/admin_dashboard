import 'dart:convert';

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

class CorredoresCarreraElement {
    CorredoresCarreraElement({
        required this.id,
        required this.race,
        required this.runner,
        required this.raceStatus,
    });

    String id;
    Race race;
    Runner runner;
    bool raceStatus;

    factory CorredoresCarreraElement.fromJson(String str) => CorredoresCarreraElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CorredoresCarreraElement.fromMap(Map<String, dynamic> json) => CorredoresCarreraElement(
        id: json["_id"],
        race: Race.fromMap(json["race"]),
        runner: Runner.fromMap(json["runner"]),
        raceStatus: json["raceStatus"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "race": race.toMap(),
        "runner": runner.toMap(),
        "raceStatus": raceStatus,
    };
}
class Race {
    Race({
        required this.id,
        required this.longName,
    });
    String id;
    String longName;
    factory Race.fromJson(String str) => Race.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());
    factory Race.fromMap(Map<String, dynamic> json) => Race(
        id: json["_id"],
        longName: json["longName"],
    );
    Map<String, dynamic> toMap() => {
        "_id": id,
        "longName": longName,
    };
}
class Runner {
    Runner({
        required this.id,
        required this.name,
    });
    String id;
    String name;
    factory Runner.fromJson(String str) => Runner.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());
    factory Runner.fromMap(Map<String, dynamic> json) => Runner(
        id: json["_id"],
        name: json["name"],
    );
    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
    };
}

