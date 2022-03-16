import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'apis_model.g.dart';

@JsonSerializable()
class ApisDataBaseModel {

  ApisDataBaseModel({
    this.key,
    this.campeones,
    this.profileLoL,
  });

  final String? key;
  final ApisLeagueOfLegends? campeones;
  final ApisLeagueOfLegends? profileLoL;

  factory ApisDataBaseModel.fromRawJson(String str) => ApisDataBaseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApisDataBaseModel.fromJson(Map<String, dynamic> json) => _$ApisDataBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApisDataBaseModelToJson(this);

}

@JsonSerializable()
class ApisLeagueOfLegends {

  ApisLeagueOfLegends({
    this.path,
    this.unencodePath
  });

  final String? path;
  final String? unencodePath;

  factory ApisLeagueOfLegends.fromRawJson(String str) => ApisLeagueOfLegends.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApisLeagueOfLegends.fromJson(Map<String, dynamic> json) => _$ApisLeagueOfLegendsFromJson(json);

  Map<String, dynamic> toJson() => _$ApisLeagueOfLegendsToJson(this);

}