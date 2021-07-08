class WeatherMap {
  static imageId(int? code) {
    WeatherDesc desc = _getWeatherDesc(code!);
    switch (desc) {
      case WeatherDesc.thunderstorm:
        return 'rain.png';
      case WeatherDesc.drizzle:
        return 'rain.png';
      case WeatherDesc.rain:
        return 'rain.png';
      case WeatherDesc.snow:
        return 'snow.png';
      case WeatherDesc.atmosphere:
        return 'wind.png';
      case WeatherDesc.clear:
        return 'clear_day.png';
      case WeatherDesc.cloudsFew:
        return 'partly_cloudy_day.png';
      case WeatherDesc.cloudsScatter:
        return 'cloudy.png';
      case WeatherDesc.cloudsBroken:
        return 'cloudy.png';
    }
  }

  static WeatherDesc _getWeatherDesc(int code) {
    if (code >= 200 && code < 300) {
      return WeatherDesc.thunderstorm;
    } else if (code >= 300 && code < 400) {
      return WeatherDesc.drizzle;
    } else if (code >= 500 && code <= 504) {
      return WeatherDesc.rain;
    } else if (code == 511) {
      return WeatherDesc.snow;
    } else if (code >= 520 && code <= 531) {
      return WeatherDesc.drizzle;
    } else if (code >= 600 && code < 700) {
      return WeatherDesc.snow;
    } else if (code == 800) {
      return WeatherDesc.clear;
    } else if (code == 801) {
      return WeatherDesc.cloudsFew;
    } else if (code == 802) {
      return WeatherDesc.cloudsScatter;
    } else if (code == 803) {
      return WeatherDesc.cloudsBroken;
    } else {
      return WeatherDesc.clear; // Default
    }
  }
}

enum WeatherDesc {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  clear,
  cloudsFew,
  cloudsScatter,
  cloudsBroken,
}
