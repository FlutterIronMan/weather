import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/utilities/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? city, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String?> parameters;

    if (isCity = true) {
      var params = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': city,
      };
      parameters = params;
    } else {
      var params = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = params;
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
