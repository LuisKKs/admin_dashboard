import 'dart:convert';

class CorredoresCarreraIdResponse {
    CorredoresCarreraIdResponse({
        required this.results,
    });

    List<List<Result>> results;

    factory CorredoresCarreraIdResponse.fromJson(String str) => CorredoresCarreraIdResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CorredoresCarreraIdResponse.fromMap(Map<String, dynamic> json) => CorredoresCarreraIdResponse(
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
        required this.preRegistration,
    });

    String id;
    Race race;
    Runner runner;
    bool raceStatus;
    String preRegistration;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
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
        required this.phoneNumber,
        required this.name,
        required this.lastname,
        required this.lastname2,
    });

    String id;
    String phoneNumber;
    String name;
    String lastname;
    String lastname2;

    factory Runner.fromJson(String str) => Runner.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Runner.fromMap(Map<String, dynamic> json) => Runner(
        id: json["_id"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        lastname: json["lastname"],
        lastname2: json["lastname2"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "phoneNumber": phoneNumber,
        "name": name,
        "lastname": lastname,
        "lastname2": lastname2,
    };
}

