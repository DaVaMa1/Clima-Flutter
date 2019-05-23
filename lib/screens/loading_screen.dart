import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    var location = Location();
    await location.getLocation();
    var data = await NetworkHelper(
            'https://samples.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=b6907d289e10d714a6e88b30761fae22')
        .getData();

    await Future.delayed(Duration(seconds: 2), () => "");

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new LocationScreen(data);
    }));
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.red,
        ),
      ),
    );
  }
}
