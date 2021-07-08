import 'package:authentic_sg_weather/app/data/models/weather/coord_model.dart';
import 'package:authentic_sg_weather/app/data/models/weather/main_model.dart';
import 'package:authentic_sg_weather/app/data/models/weather/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open_weather_model.g.dart';

@JsonSerializable()
class OpenWeatherModel {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final MainModel main;
  final int dt;
  final int id;
  final String name;

  OpenWeatherModel({
    required this.coord,
    required this.weather,
    required this.main,
    required this.dt,
    required this.id,
    required this.name,
  });

  factory OpenWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherModelToJson(this);
}
