import 'package:flutter/material.dart';
import 'widgets/background_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Company X',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: BackgroundImage(imageUrl: 'images/WindTurbines.jpg'),
        ),
      ),
    );
  }
}
