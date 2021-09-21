import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/widgets/bottom_list_widget.dart';
import 'package:weather/widgets/city_widget.dart';
import 'package:weather/widgets/detail_widget.dart';
import 'package:weather/widgets/temp_widget.dart';

class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecast locationWeather;

  WeatherForecastScreen({required this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName;

  @override
  void initState() {
    super.initState();

    forecastObject = Future.value(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Прогноз погоди'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(city: _cityName, isCity: true);
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      CityWidget(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      TempWidget(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      DetailWidget(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      BottomListWidget(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      'Місто не знайдено\nВведіть правильну назву',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
