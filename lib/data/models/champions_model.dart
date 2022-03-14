import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'champions_model.g.dart';

@JsonSerializable()
class ChampionsModel {

  String? type;
  String? format;
  String? version;
  Map<String, Data>? data;

  ChampionsModel({
    this.type,
    this.format,
    this.version,
    this.data
  });

  factory ChampionsModel.fromRawJson(String str) => ChampionsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChampionsModel.fromJson(Map<String, dynamic> json) => _$ChampionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionsModelToJson(this);

}


@JsonSerializable()
class Data {

  String? version;
  String? id;
  String? key;
  String? name;
  String? title;
  String? blurb;
  Info? info;
  Image? image;
  List<String>? tags;
  String? partype;
  Map<String, double>? stats;

  Data({
    this.version,
    this.id,
    this.key,
    this.name,
    this.title,
    this.blurb,
    this.info,
    this.image,
    this.tags,
    this.partype,
    this.stats
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Info {

  int? attack;
  int? defense;
  int? magic;
  int? difficulty;

  Info({
    this.attack,
    this.defense,
    this.magic,
    this.difficulty
  });

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

}


@JsonSerializable()
class Image {

  String? full;
  String? sprite;
  String? group;
  int? x;
  int? y;
  int? w;
  int? h;

  Image({
    this.full,
    this.sprite,
    this.group,
    this.x,
    this.y,
    this.w,
    this.h
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

}