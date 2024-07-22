import 'package:weatherapp/models/weather_model.dart';

class WeatherState {}

class InitialeState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weathermodel weathermodel;

  WeatherLoadedState(this.weathermodel);
}

class WEatherFailurState extends WeatherState {}
