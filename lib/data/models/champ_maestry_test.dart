import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'champ_maestry_test.g.dart';

@JsonSerializable()
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

  factory ChampionMaestryModel.fromRawJson(String str) => ChampionMaestryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChampionMaestryModel.fromJson(Map<String, dynamic> json) => _$ChampionMaestryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionMaestryModelToJson(this);

}

