import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/git_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialeState());
  Weathermodel? weathermodel;
  fetchWeather({required String cityname}) async {
    try {
       weathermodel =
          await WeatherServices(Dio()).getCurrentWeather(cityname: cityname);
      emit(WeatherLoadedState(weathermodel!));
    } catch (e) {
      emit(WEatherFailurState());
    }
  }
}
