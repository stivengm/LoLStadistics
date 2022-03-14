// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionsModel _$ChampionsModelFromJson(Map<String, dynamic> json) =>
    ChampionsModel(
      type: json['type'] as String?,
      format: json['format'] as String?,
      version: json['version'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Data.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ChampionsModelToJson(ChampionsModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'format': instance.format,
      'version': instance.version,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      version: json['version'] as String?,
      id: json['id'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      blurb: json['blurb'] as String?,
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      partype: json['partype'] as String?,
      stats: (json['stats'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'version': instance.version,
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'title': instance.title,
      'blurb': instance.blurb,
      'info': instance.info,
      'image': instance.image,
      'tags': instance.tags,
      'partype': instance.partype,
      'stats': instance.stats,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      attack: json['attack'] as int?,
      defense: json['defense'] as int?,
      magic: json['magic'] as int?,
      difficulty: json['difficulty'] as int?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'attack': instance.attack,
      'defense': instance.defense,
      'magic': instance.magic,
      'difficulty': instance.difficulty,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      full: json['full'] as String?,
      sprite: json['sprite'] as String?,
      group: json['group'] as String?,
      x: json['x'] as int?,
      y: json['y'] as int?,
      w: json['w'] as int?,
      h: json['h'] as int?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'full': instance.full,
      'sprite': instance.sprite,
      'group': instance.group,
      'x': instance.x,
      'y': instance.y,
      'w': instance.w,
      'h': instance.h,
    };
