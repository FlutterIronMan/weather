import 'package:flutter/material.dart';
import 'package:weather/models/weather_forecast_daily.dart';

class TempWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempWidget({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp.max.toStringAsFixed(0);
    var description = forecastList?[0].weather[0].description.toUpperCase();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon!,
            scale: 1,
            color: Colors.teal,
          ),
          SizedBox(width: 20.0),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(
                  fontSize: 54.0,
                  color: Colors.teal,
                ),
              ),
              Text(
                '$description',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
