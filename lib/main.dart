import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/git_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/git_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weathermodel
                        ?.status),
              ),
              debugShowCheckedModeBanner: false,
              home: const Homview(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? status) {
  if (status == null) {
    return Colors.blue;
  }
  switch (status) {
    case 'Sunny':
      return Colors.deepOrange;

    case 'Partly cloudy':
    case 'Overcast':
    case 'Patchy snow possible':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;

    case 'Cloudy':
    case 'Mist':
    case 'Patchy sleet possible':
    case 'Fog':
    case 'Freezing fog':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.blue;

    case 'Thundery outbreaks possible':
      return Colors.yellow;

    default:
      return Colors.blue;
  }
}
