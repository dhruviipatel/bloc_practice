// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NextWeatherModel {
  final double nextTemp;
  final String nextSky;
  final double nextPressure;
  final double nextWindSpeed;
  final double nextHumidity;

  NextWeatherModel({
    required this.nextTemp,
    required this.nextSky,
    required this.nextPressure,
    required this.nextWindSpeed,
    required this.nextHumidity,
  });

  NextWeatherModel copyWith({
    double? nextTemp,
    String? nextSky,
    double? nextPressure,
    double? currentWindSpeed,
    double? nextHumidity,
  }) {
    return NextWeatherModel(
      nextTemp: nextTemp ?? this.nextTemp,
      nextSky: nextSky ?? this.nextSky,
      nextPressure: nextPressure ?? this.nextPressure,
      nextWindSpeed: currentWindSpeed ?? this.nextWindSpeed,
      nextHumidity: nextHumidity ?? this.nextHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nextTemp': nextTemp,
      'nextSky': nextSky,
      'nextPressure': nextPressure,
      'nextWindSpeed': nextWindSpeed,
      'nextHumidity': nextHumidity,
    };
  }

  factory NextWeatherModel.fromMap(Map<String, dynamic> map) {
    final nextWeatherData = map['list'][0];

    return NextWeatherModel(
      nextTemp: (nextWeatherData['main']['temp'] as num).toDouble(),
      nextSky: nextWeatherData['weather'][0]['main'],
      nextPressure: (nextWeatherData['main']['pressure'] as num).toDouble(),
      nextWindSpeed: (nextWeatherData['wind']['speed'] as num).toDouble(),
      nextHumidity: (nextWeatherData['main']['humidity'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory NextWeatherModel.fromJson(String source) =>
      NextWeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NextWeatherModel(currentTemp: $nextTemp, currentSky: $nextSky, currentPressure: $nextPressure, currentWindSpeed: $nextWindSpeed, currentHumidity: $nextHumidity)';
  }

  @override
  bool operator ==(covariant NextWeatherModel other) {
    if (identical(this, other)) return true;

    return other.nextTemp == nextTemp &&
        other.nextSky == nextSky &&
        other.nextPressure == nextPressure &&
        other.nextWindSpeed == nextWindSpeed &&
        other.nextHumidity == nextHumidity;
  }

  @override
  int get hashCode {
    return nextTemp.hashCode ^
        nextSky.hashCode ^
        nextPressure.hashCode ^
        nextWindSpeed.hashCode ^
        nextHumidity.hashCode;
  }
}
