import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'locationscreen.dart';
import 'network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var weatherdata;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var permissions;
  var longitude;
  var lattitude;
  void getCurrentPosition() async {
    permissions = await Geolocator.checkPermission();
    if (permissions == LocationPermission.denied) {
      permissions = Geolocator.requestPermission();

      if (permissions == LocationPermission.denied) {
        print('Permission denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    lattitude = position.latitude;
    longitude = position.longitude;
    networkhelper helper = networkhelper(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?units=metric&lat=$lattitude&lon=$longitude&appid=a67cbb0bb50f199ee71118ac40c1e561'));

    weatherdata = await helper.getdata();
    //print(weatherdata);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherdata);
    }));

    print(position.latitude);
    print(position.longitude);
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Abrera Lab 9'))),
      body: Center(
        child: Column(children: [
          Center(
            child: SpinKitHourGlass(
              color: Color.fromARGB(255, 194, 22, 22),
              size: 40,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                getCurrentPosition();
              });
            },
            child: Text("Get Location"),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocationScreen(
                              locationWeather: weatherdata,
                            )));
              },
              child: Text("Go to Screen 2")),
        ]),
      ),
    );
  }
}
