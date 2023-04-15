import 'package:flutter/material.dart';
import 'screens/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima Weather App',
      theme: ThemeData.dark(),
      home: loadingScreen(),
    );
  }
}

