import 'package:authentic_sg_weather/app/data/models/phrase/phrase_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phrase_list_model.g.dart';

@JsonSerializable()
class PhraseListModel {
  final List<PhraseModel> phrases;

  PhraseListModel({required this.phrases});

  factory PhraseListModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhraseListModelToJson(this);
}
