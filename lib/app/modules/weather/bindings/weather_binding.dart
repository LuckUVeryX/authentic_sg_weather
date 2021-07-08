import 'package:authentic_sg_weather/app/data/providers/weather_provider.dart';
import 'package:get/get.dart';

import '../controllers/location_controller.dart';

class WeatherBindng extends Bindings {
  @override
  void dependencies() {
    Get.put(WeatherProvider(), permanent: true);
    Get.put(
      LocationController(weatherProvider: Get.find<WeatherProvider>()),
      permanent: true,
    );
  }
}
