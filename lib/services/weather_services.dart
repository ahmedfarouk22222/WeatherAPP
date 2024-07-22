import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String apiKey = 'fc4d648acf1541678ef232218240607';
  final String baseUrl = 'https://api.weatherapi.com/v1';
  WeatherServices(this.dio);
  Future<Weathermodel> getCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=10');

      Weathermodel weathermodel = Weathermodel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errormessage = e.response?.data['error']['message'] ??
          'oops there was an error ,try latter';
      throw Exception(errormessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try latter');
    }
  }

  Future<Weathermodel> getforcast({required String cityname}) async {
    Response response = await dio
        .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname`&days=10');
    Weathermodel weathermodel = Weathermodel.fromJson(response.data);
    return weathermodel;
  }
}
