import 'package:authentic_sg_weather/core/utils/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../models/weather/open_weather_model.dart';

class WeatherProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://api.openweathermap.org/data/2.5/';
  }

  Future<OpenWeatherModel?> getWeatherData(Position? position) async {
    try {
      if (position != null) {
        Response response = await get(
            'weather?lat=${position.latitude}&lon=${position.longitude}&appid=${ApiKey.key}&units=metric');
        OpenWeatherModel weather = OpenWeatherModel.fromJson(response.body);
        return weather;
      }
    } catch (e) {
      debugPrint('getWeatherData error: ${e.toString()}');
    }
  }
}
