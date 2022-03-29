import 'dart:convert';

class WeatherModel {

WeatherModel({required this.weatherdata});
dynamic weatherdata;
late int roundedWeather;  
late String cityName;
late String iconSmart;
late String message;


void updateUI(){
  
    
    double currentTemperature = jsonDecode(weatherdata)['main']['temp'];
    roundedWeather = currentTemperature.round();    
    cityName = jsonDecode(weatherdata)['name'];  
    int weatherId = jsonDecode(weatherdata)['weather'][0]['id'];
    iconSmart = getWeatherIcon(weatherId);
    message = getMessage(roundedWeather);
    
  }
  
    


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
