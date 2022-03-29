import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';




class LocationScreen extends StatefulWidget {
  LocationScreen({required this.weatherdata});
  dynamic weatherdata;
  
late WeatherModel weathermodel = WeatherModel(weatherdata: weatherdata);


  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  
  @override
 



  void initState() {
    // TODO: implement initState
    super.initState();

    widget.weathermodel.updateUI();
    //widget.weathermodel.updateUI();
  }

  @override
  
  Widget build(BuildContext context) {

  


    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{

                      var typedCityName =  await Navigator.pushNamed(context, '/city');
                      if (typedCityName != ''){
                      print(typedCityName);
                      NetworkHelper neth = NetworkHelper();
                      
                      var bodyData = await neth.getCitySearch(cityname: typedCityName);
                      print(bodyData);

                      setState(() {
                       widget.weathermodel = WeatherModel(weatherdata: bodyData);
                       widget.weathermodel.updateUI();
                         
                      });}
                      



                    
                    
                      },
                    
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${widget.weathermodel.roundedWeather}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      widget.weathermodel.iconSmart,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${widget.weathermodel.message} in ${widget.weathermodel.cityName}",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
