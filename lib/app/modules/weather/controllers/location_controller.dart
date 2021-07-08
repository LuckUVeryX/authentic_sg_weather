import 'dart:async';
import 'dart:convert';

import 'package:authentic_sg_weather/app/data/models/phrase_model.dart';
import 'package:authentic_sg_weather/app/data/models/weather_model.dart';
import 'package:authentic_sg_weather/app/data/providers/weather_provider.dart';
import 'package:authentic_sg_weather/app/routes/app_pages.dart';
import 'package:authentic_sg_weather/core/values/weather_mapper.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  LocationController({
    required weatherProvider,
  }) : _weatherProvider = weatherProvider;

  Location location = Location();
  LocationData? locationData;
  final WeatherProvider _weatherProvider;
  Rx<WeatherModel> weather = WeatherModel().obs;
  PhraseModel? _phraseModel;

  int? get weatherCode => weather.value.weather?[0].id; // Default to mist
  String get weatherIcon => 'assets/icons/${WeatherMap.imageId(weatherCode)}';
  String? get weatherDesc => weather.value.weather?[0].description;
  String? get temp => weather.value.main?.feelsLike.toString();
  String? get locationName => weather.value.name;

  Phrases? get phrase {
    return _phraseModel?.phrases?.firstWhere((phrase) {
      return phrase.condition == weatherDesc;
    });
  }

  @override
  void onInit() {
    super.onInit();
    _initFunction();
  }

  void _initFunction() async {
    await _parseJsonFromAssets();
    await _getWeather();
  }

  Future<void> _getWeather() async {
    bool permissionGranted = await _checkLocationPermisson();

    if (permissionGranted) {
      locationData = await location.getLocation();
      if (locationData != null) {
        weather.value = (await _weatherProvider.getWeatherData(locationData!))!;
        debugPrint('Loc: ${weather.value.name}');
        debugPrint('Desc: ${weather.value.weather![0].description}');
      }
      if (_phraseModel != null) {
        Get.offNamed(Routes.home);
      }
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

  Future<bool> _checkLocationPermisson() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<void> _parseJsonFromAssets() async {
    String response = await rootBundle.loadString('assets/json/phrases.json');
    _phraseModel = PhraseModel.fromJson(jsonDecode(response));
  }
}
