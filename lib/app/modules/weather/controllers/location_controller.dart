import 'dart:async';
import 'dart:convert';

import 'package:authentic_sg_weather/app/data/models/phrase/phrase_list_model.dart';
import 'package:authentic_sg_weather/app/data/models/phrase/phrase_model.dart';
import 'package:authentic_sg_weather/app/data/models/weather/open_weather_model.dart';
import 'package:authentic_sg_weather/app/data/providers/weather_provider.dart';
import 'package:authentic_sg_weather/app/routes/app_pages.dart';
import 'package:authentic_sg_weather/core/values/weather_mapper.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationController extends GetxController {
  LocationController({
    required weatherProvider,
  }) : _weatherProvider = weatherProvider;

  final WeatherProvider _weatherProvider;

  PhraseListModel? _phraseListModel;

  Rxn<Position> positionStream = Rxn<Position>();
  Rxn<OpenWeatherModel> weather = Rxn<OpenWeatherModel>();

  String? get weatherIconId => weather.value?.weather[0].icon;
  String get weatherIcon =>
      'assets/icons/${WeatherIcons.imageId(weatherIconId)}';
  String? get weatherDesc => weather.value?.weather[0].description;
  String? get temp => weather.value?.main.feelsLike.toString();
  String? get locationName => weather.value?.name;

  PhraseModel? get phrase {
    if (_phraseListModel?.phrases != null && weatherDesc != null) {
      return _phraseListModel?.phrases.firstWhere((phrase) {
        return phrase.condition == weatherDesc;
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initFunction();
  }

  void _initFunction() async {
    await _parseJsonFromAssets();

    bool permissionGranted = await _checkLocationPermisson();
    if (permissionGranted) {
      await _bindLocationStream();
    } else {
      Get.dialog(
        const AlertDialog(
          title: Text('Oi.'),
          content:
              Text('Want check weather need turn on location right? Stupiak.'),
        ),
      );
    }
  }

  Future<void> _bindLocationStream() async {
    positionStream.bindStream(Geolocator.getPositionStream(
      distanceFilter: 1000,
    ));
    ever(positionStream, _getUpdatedWeather);
    Get.offNamed(Routes.home);
  }

  Future<void> _getUpdatedWeather(Position? position) async {
    weather.value = (await _weatherProvider.getWeatherData(position))!;
    debugPrint('Loc: ${weather.value?.name}');
    debugPrint('Desc: ${weather.value?.weather[0].description}');
  }

  Future<bool> _checkLocationPermisson() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }

  Future<void> _parseJsonFromAssets() async {
    String response = await rootBundle.loadString('assets/json/phrases.json');
    _phraseListModel = PhraseListModel.fromJson(jsonDecode(response));
  }
}
