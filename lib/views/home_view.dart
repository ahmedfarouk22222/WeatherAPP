import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/git_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/git_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/views/searchview.dart';
import 'package:weatherapp/widget/noweather_body.dart';
import 'package:weatherapp/widget/wheatherinfo_body.dart';

class Homview extends StatelessWidget {
  const Homview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff005C78),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:const  Color(0xff005C78),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Searchview();
              }));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is InitialeState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            state.weathermodel;
            return WeatherInfoBody(weather: state.weathermodel);
          } else {
            return const Text('opps there was an error');
          }
        },
      ),
    );
  }
}
