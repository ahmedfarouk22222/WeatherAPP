import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/git_weather_cubit/get_weather_cubit.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff005C78),
      appBar: AppBar(
        title: const Text(
          'Search City',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff005C78),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.fetchWeather(cityname: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Enter City Name ',
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: Colors.white,
              labelText: 'Search',
              labelStyle: const TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
