import 'package:json_annotation/json_annotation.dart';

part 'coord_model.g.dart';

@JsonSerializable()
class CoordModel {
  final double lon;
  final double lat;

  CoordModel({
    required this.lon,
    required this.lat,
  });
  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordModelToJson(this);
}
