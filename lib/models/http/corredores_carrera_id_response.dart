import 'dart:convert';

class CorredoresCarreraId {
    CorredoresCarreraId({
        required this.results,
    });

    List<List<Result>> results;

    factory CorredoresCarreraId.fromJson(String str) => CorredoresCarreraId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CorredoresCarreraId.fromMap(Map<String, dynamic> json) => CorredoresCarreraId(
        results: List<List<Result>>.from(json["results"].map((x) => List<Result>.from(x.map((x) => Result.fromMap(x))))),
    );

    Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
    };
}

class Result {
    Result({
        required this.id,
        required this.race,
        required this.runner,
        required this.raceStatus,
    });

    String id;
    Race race;
    Runner runner;
    bool raceStatus;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
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

