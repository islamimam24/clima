// ignore_for_file: unused_import, deprecated_member_use

import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
// import 'package:clima/utilities/';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/app-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(right: 10.0, left: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: kTextFieldDecoration,
                    onChanged: (value) {
                      cityName = value;

                      /// .. (button 2) the user enters the value for the cityName ..
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);

                  /// .. (button 3) and once the city Screen popped off, cityName passed back to the location Screen as an output of the typedName..
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
