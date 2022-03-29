import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void networkhandler() async {
    NetworkHelper nHelper = NetworkHelper();
    String data = await nHelper.getWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherdata: data,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networkhandler();
  }

  @override
  Widget build(BuildContext context) {
    //print('build called');
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
          ),
        ));
  }
}
