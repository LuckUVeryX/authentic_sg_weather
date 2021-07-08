// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhraseListModel _$PhraseListModelFromJson(Map<String, dynamic> json) {
  return PhraseListModel(
    phrases: (json['phrases'] as List<dynamic>)
        .map((e) => PhraseModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PhraseListModelToJson(PhraseListModel instance) =>
    <String, dynamic>{
      'phrases': instance.phrases,
    };
