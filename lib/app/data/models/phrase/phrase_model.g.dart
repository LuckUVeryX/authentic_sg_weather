// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhraseModel _$PhraseModelFromJson(Map<String, dynamic> json) {
  return PhraseModel(
    highlight:
        (json['highlight'] as List<dynamic>).map((e) => e as String).toList(),
    title: json['title'] as String,
    subline: json['subline'] as String,
    condition: json['condition'] as String,
    color: json['color'] as String,
  );
}

Map<String, dynamic> _$PhraseModelToJson(PhraseModel instance) =>
    <String, dynamic>{
      'highlight': instance.highlight,
      'title': instance.title,
      'subline': instance.subline,
      'condition': instance.condition,
      'color': instance.color,
    };
