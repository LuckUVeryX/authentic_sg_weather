import 'package:json_annotation/json_annotation.dart';

part 'phrase_model.g.dart';

@JsonSerializable()
class PhraseModel {
  final List<String> highlight;
  final String title;
  final String subline;
  final String condition;
  final String color;

  PhraseModel({
    required this.highlight,
    required this.title,
    required this.subline,
    required this.condition,
    required this.color,
  });
  factory PhraseModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhraseModelToJson(this);
}
