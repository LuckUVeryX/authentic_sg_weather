// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherModel _$OpenWeatherModelFromJson(Map<String, dynamic> json) {
  return OpenWeatherModel(
    coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
    weather: (json['weather'] as List<dynamic>)
        .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
    dt: json['dt'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$OpenWeatherModelToJson(OpenWeatherModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'main': instance.main,
      'dt': instance.dt,
      'id': instance.id,
      'name': instance.name,
    };
