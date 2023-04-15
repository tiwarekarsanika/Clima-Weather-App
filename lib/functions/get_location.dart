import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class getLocation{

  double? longitude;
  double? latitude;

  Future <void> location() async {
    LocationPermission permission = await Geolocator.requestPermission();

    try{
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
      print(position);
    }catch(e){
      print(e);
    } 
  }
}