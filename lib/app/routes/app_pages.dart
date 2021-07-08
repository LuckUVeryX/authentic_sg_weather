import 'package:authentic_sg_weather/app/modules/weather/bindings/weather_binding.dart';
import 'package:authentic_sg_weather/app/modules/weather/views/home_view.dart';
import 'package:authentic_sg_weather/app/modules/weather/views/loading_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.loading;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.loading,
      page: () => const LoadingView(),
      binding: WeatherBindng(),
    ),
  ];
}
