import 'package:authentic_sg_weather/core/utils/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../models/weather_model.dart';

class WeatherProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://api.openweathermap.org/data/2.5/';
  }

  Future<WeatherModel?> getWeatherData(LocationData locationData) async {
    try {
      Response response = await get(
          'weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${ApiKey.key}&units=metric');
      WeatherModel weather = WeatherModel.fromJson(response.body);
      return weather;
    } catch (e) {
      debugPrint('getWeatherData error: ${e.toString()}');
    }
  }
}
