import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherIcon {
  Widget getIcon(int condition) {
    if (condition < 300) {
      return Image.network('http://openweathermap.org/img/wn/02d@2x.png');
    } else if (condition < 400) {
      return Image.network('http://openweathermap.org/img/wn/09d@2x.png');
    } else if (condition < 600) {
      return Image.network('http://openweathermap.org/img/wn/10d@2x.png');
    } else if (condition < 700) {
      return Image.network('http://openweathermap.org/img/wn/13d@2x.png');
    } else if (condition < 800) {
      return Image.network('http://openweathermap.org/img/wn/04d@2x.png');
    } else if (condition == 800) {
      return Image.network('http://openweathermap.org/img/wn/01d@2x.png');
    } else if (condition <= 804) {
      return Image.network('http://openweathermap.org/img/wn/03d@2x.png');
    } else {
      return Image.network(
          'https://www.pngfind.com/mpng/iJhbi_question-mark-png-image-transparent-white-question-mark/');
    }
  }
}
