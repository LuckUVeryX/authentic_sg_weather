import 'dart:async';
import 'dart:convert';

import 'package:authentic_sg_weather/app/data/models/phrase/phrase_list_model.dart';
import 'package:authentic_sg_weather/app/data/models/phrase/phrase_model.dart';
import 'package:authentic_sg_weather/app/data/models/weather/open_weather_model.dart';
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

  final WeatherProvider _weatherProvider;

  Location location = Location();
  PhraseListModel? _phraseListModel;

  Rxn<LocationData> locationStream = Rxn<LocationData>();
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
    await location.changeSettings(distanceFilter: 1000);
    locationStream.bindStream(location.onLocationChanged);
    ever(locationStream, _getUpdatedWeather);
    Get.offNamed(Routes.home);
  }

  Future<void> _getUpdatedWeather(LocationData? locationStream) async {
    weather.value = (await _weatherProvider.getWeatherData(locationStream))!;
    debugPrint('Loc: ${weather.value?.name}');
    debugPrint('Desc: ${weather.value?.weather[0].description}');
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
    _phraseListModel = PhraseListModel.fromJson(jsonDecode(response));
  }
}
