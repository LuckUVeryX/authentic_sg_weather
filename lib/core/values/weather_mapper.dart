class WeatherIcons {
  /// Maps OpenWeatherMap icons to our own icons
  static String? imageId(String? iconId) {
    switch (iconId) {
      case '01d':
        return 'clear_day.png';
      case '02d':
        return 'partly_cloudy_day.png';
      case '03d':
        return 'cloudy.png';
      case '04d':
        return 'cloudy.png';
      case '09d':
        return 'rain.png';
      case '10d':
        return 'rain.png';
      case '11d':
        return 'rain.png';
      case '13d':
        return 'snow.png';
      case '50d':
        return 'wind.png';
      case '01n':
        return 'clear_night.png';
      case '02n':
        return 'partly_cloudy_night.png';
      case '03n':
        return 'cloudy.png';
      case '04n':
        return 'cloudy.png';
      case '09n':
        return 'rain.png';
      case '10n':
        return 'rain.png';
      case '11n':
        return 'rain.png';
      case '13n':
        return 'snow.png';
      case '50n':
        return 'wind.png';
      default:
        return 'sleet.png';
    }
  }
}
