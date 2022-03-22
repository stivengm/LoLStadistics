import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'images_model.g.dart';

@JsonSerializable()
class ImagesModel {

  ImagesModel({
    this.league,
    this.maestria
  });

  final List<League?>? league;
  final List<Maestria?>? maestria;

  factory ImagesModel.fromRawJson(String str) => ImagesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImagesModel.fromJson(Map<String, dynamic> json) => _$ImagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesModelToJson(this);

}



@JsonSerializable()
class League {

  League({
    this.id,
    this.nombre,
    this.url,
  });

  final int? id;
  final String? nombre;
  final String? url;

  factory League.fromRawJson(String str) => League.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);

}


@JsonSerializable()
class Maestria {

  Maestria({
    this.id,
    this.url,
  });

  final int? id;
  final String? url;

  factory Maestria.fromRawJson(String str) => Maestria.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Maestria.fromJson(Map<String, dynamic> json) => _$MaestriaFromJson(json);

  Map<String, dynamic> toJson() => _$MaestriaToJson(this);

}