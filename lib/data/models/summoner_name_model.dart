import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'summoner_name_model.g.dart';

@JsonSerializable()
class SummonerNameModel {

  SummonerNameModel({
    this.id,
    this.accountId,
    this.puuid,
    this.name,
    this.profileIconId,
    this.revisionDate,
    this.summonerLevel,
  });

  final String? id;
  final String? accountId;
  final String? puuid;
  final String? name;
  final int? profileIconId;
  final int? revisionDate;
  final int? summonerLevel;

  factory SummonerNameModel.fromRawJson(String str) => SummonerNameModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SummonerNameModel.fromJson(Map<String, dynamic> json) => _$SummonerNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$SummonerNameModelToJson(this);

}