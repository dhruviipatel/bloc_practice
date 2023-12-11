import 'package:bloc/bloc.dart';
import 'package:learn_bloc/bloc/weather_bloc/allWeatherDataModel.dart';
import 'package:learn_bloc/bloc/weather_bloc/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetch>(_getcurrentweather);
  }

  void _getcurrentweather(
      WeatherFetch event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather(event.cityName);
      emit(WeatherSuccess(allWeatherData: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
