import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/background_image.dart';
import 'widgets/nav_bar.dart';
import 'provider/page_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PageState(),
      child: const MyApp(),
    ),
  );
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
        body: Stack(
          children: [
            BackgroundImage(
                imageUrl:
                    'images/WindTurbines.jpg'), // Credit: Pexels, 哲聖 林, Wind Turbines on the Coast of a Sea
            NavBar(),
          ],
        ),
      ),
    );
  }
}
