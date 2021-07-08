import 'package:authentic_sg_weather/core/utils/keys.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../models/weather/open_weather_model.dart';

class WeatherProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://api.openweathermap.org/data/2.5/';
  }

  Future<OpenWeatherModel?> getWeatherData(LocationData? locationData) async {
    // try {
    if (locationData != null) {
      Response response = await get(
          'weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${ApiKey.key}&units=metric');
      OpenWeatherModel weather = OpenWeatherModel.fromJson(response.body);
      return weather;
    }
    // } catch (e) {
    //   debugPrint('getWeatherData error: ${e.toString()}');
    // }
  }
}
