import 'package:flutter/material.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/widgets/forecast_card.dart';

class BottomListWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListWidget({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Прогноз погоди на 7 днів'.toUpperCase(),
          style: TextStyle(
              fontSize: 20.0, color: Colors.teal, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: snapshot.data!.list!.length,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.teal,
              child: forecastCard(snapshot, index),
            ),
          ),
        ),
      ],
    );
  }
}
