import 'dart:convert';
import 'package:learn_bloc/bloc/weather_bloc/allWeatherDataModel.dart';
import 'package:learn_bloc/bloc/weather_bloc/data_provider.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  getCurrentWeather(cityName) async {
    try {
      // Position position = await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.high);

      // var _currentLocation =
      //     'Latitude: ${position.latitude}, Longitude: ${position.longitude}';

      // print(_currentLocation);

      final weather = await weatherDataProvider.getCurrentWeather(cityName);
      final data = jsonDecode(weather);

      print(weather);

      if (data['cod'] != '200') {
        throw 'unexpected error occur';
      }

      return AllWeatherData.fromJson(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
