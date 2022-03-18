import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'league_model.g.dart';

@JsonSerializable()
class LeagueModel {

  LeagueModel({
    this.leagueId,
    this.queueType,
    this.tier,
    this.rank,
    this.summonerId,
    this.summonerName,
    this.leaguePoints,
    this.wins,
    this.losses,
    this.veteran,
    this.inactive,
    this.freshBlood,
    this.hotStreak,
  });

  final String? leagueId;
  final String? queueType;
  final String? tier;
  final String? rank;
  final String? summonerId;
  final String? summonerName;
  final int? leaguePoints;
  final int? wins;
  final int? losses;
  final bool? veteran;
  final bool? inactive;
  final bool? freshBlood;
  final bool? hotStreak;

  factory LeagueModel.fromRawJson(String str) => LeagueModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LeagueModel.fromJson(Map<String, dynamic> json) => _$LeagueModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueModelToJson(this);

}