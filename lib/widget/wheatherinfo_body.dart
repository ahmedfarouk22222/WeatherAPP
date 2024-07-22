import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/git_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });
  final Weathermodel weather;

  @override
  Widget build(BuildContext context) {
    Weathermodel? weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weathermodel!;
    weathermodel.image.contains('https');
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(weathermodel.status),
          getThemeColor(weathermodel.status)[500]!,
          getThemeColor(weathermodel.status)[100]!
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weathermodel.cityname,
                style:const TextStyle(
                    fontSize: 33,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'update at ${weathermodel.date.hour}:${weathermodel.date.minute}',
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            const  SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https:${weathermodel.image}",
                  ),
                  Text(
                    weathermodel.temp.toString(),
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp :${weathermodel.maxtemp.round()}',
                        style:const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        'Minitemp : ${weathermodel.minitemp.round()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
        const      SizedBox(
                height: 32,
              ),
              Text(
                weathermodel.status,
                style:const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
