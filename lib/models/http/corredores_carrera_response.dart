import 'dart:convert';

class CorredoresCarreraResponse {
    CorredoresCarreraResponse({
        required this.total,
        required this.corredoresCarrera,
    });

    int total;
    List<CorredoresCarrera> corredoresCarrera;

    factory CorredoresCarreraResponse.fromJson(String str) => CorredoresCarreraResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CorredoresCarreraResponse.fromMap(Map<String, dynamic> json) => CorredoresCarreraResponse(
        total: json["total"],
        corredoresCarrera: List<CorredoresCarrera>.from(json["corredoresCarrera"].map((x) => CorredoresCarrera.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "corredoresCarrera": List<dynamic>.from(corredoresCarrera.map((x) => x.toMap())),
    };
}

class CorredoresCarrera {
    CorredoresCarrera({
        required this.id,
        required this.race,
        required this.runner,
        required this.raceStatus,
        required this.preRegistration,
    });

    String id;
    Race race;
    Runner runner;
    bool raceStatus;
    String preRegistration;

    factory CorredoresCarrera.fromJson(String str) => CorredoresCarrera.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CorredoresCarrera.fromMap(Map<String, dynamic> json) => CorredoresCarrera(
        id: json["_id"],
        race: Race.fromMap(json["race"]),
        runner: Runner.fromMap(json["runner"]),
        raceStatus: json["raceStatus"],
        preRegistration: json["preRegistration"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "race": race.toMap(),
        "runner": runner.toMap(),
        "raceStatus": raceStatus,
        "preRegistration": preRegistration,
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

