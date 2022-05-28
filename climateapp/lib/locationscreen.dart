import 'package:flutter/material.dart';
import 'weatherIcons.dart';
import 'dart:convert';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationWeather});
  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherIcon icon = WeatherIcon();
  var temp;
  var cityname;
  var weathericon;
  @override
  void updateUI(dynamic locationweather) {
    temp = locationweather['main']['temp'];
    var weathercode = locationweather['weather'][0]['id'];
    weathericon = icon.getIcon(weathercode);

    cityname = locationweather['name'].toString();
  }

  void initState() {
    super.initState();
    print(widget.locationWeather);
    updateUI(widget.locationWeather);
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(temp.toString()),
        Text(cityname.toString()),
        weathericon,
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'))
      ],
    );
  }
}
