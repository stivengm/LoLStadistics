import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'champions_maestry.g.dart';

@JsonSerializable()
class ChampionsMaestryModel {

  int? championId;
  int? championLevel;
  int? championPoints;
  int? lastPlayTime;
  int? championPointsSinceLastLevel;
  int? championPointsUntilNextLevel;
  bool? chestGranted;
  int? tokensEarned;
  String? summonerId;

  ChampionsMaestryModel({
    this.championId,
    this.championLevel,
    this.championPoints,
    this.lastPlayTime,
    this.championPointsSinceLastLevel,
    this.championPointsUntilNextLevel,
    this.chestGranted,
    this.tokensEarned,
    this.summonerId
  });

  factory ChampionsMaestryModel.fromRawJson(String str) => ChampionsMaestryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChampionsMaestryModel.fromJson(Map<String, dynamic> json) => _$ChampionsMaestryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionsMaestryModelToJson(this);

}