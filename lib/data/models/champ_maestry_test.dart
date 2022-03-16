// To parse this JSON data, do
//
//     final championMaestryModel = championMaestryModelFromMap(jsonString);

import 'dart:convert';

class ChampionMaestryModel {
    ChampionMaestryModel({
        this.championId,
        this.championLevel,
        this.championPoints,
        this.lastPlayTime,
        this.championPointsSinceLastLevel,
        this.championPointsUntilNextLevel,
        this.chestGranted,
        this.tokensEarned,
        this.summonerId,
    });

    int? championId;
    int? championLevel;
    int? championPoints;
    int? lastPlayTime;
    int? championPointsSinceLastLevel;
    int? championPointsUntilNextLevel;
    bool? chestGranted;
    int? tokensEarned;
    String? summonerId;

    factory ChampionMaestryModel.fromJson(String str) => ChampionMaestryModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ChampionMaestryModel.fromMap(Map<String, dynamic> json) => ChampionMaestryModel(
        championId: json["championId"],
        championLevel: json["championLevel"],
        championPoints: json["championPoints"],
        lastPlayTime: json["lastPlayTime"],
        championPointsSinceLastLevel: json["championPointsSinceLastLevel"],
        championPointsUntilNextLevel: json["championPointsUntilNextLevel"],
        chestGranted: json["chestGranted"],
        tokensEarned: json["tokensEarned"],
        summonerId: json["summonerId"],
    );

    Map<String, dynamic> toMap() => {
        "championId": championId,
        "championLevel": championLevel,
        "championPoints": championPoints,
        "lastPlayTime": lastPlayTime,
        "championPointsSinceLastLevel": championPointsSinceLastLevel,
        "championPointsUntilNextLevel": championPointsUntilNextLevel,
        "chestGranted": chestGranted,
        "tokensEarned": tokensEarned,
        "summonerId": [summonerId],
    };
}

