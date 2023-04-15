import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'result.dart';

class NetworkData {
  WeatherModel weather = WeatherModel();
  final String url;

  NetworkData({required this.url});

  Future getData() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return print(response.statusCode);
    }
  }
}
