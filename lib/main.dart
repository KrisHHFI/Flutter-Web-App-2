import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/background_image.dart';
import 'widgets/home_page_content.dart';
import 'widgets/nav_bar.dart';
import 'provider/page_state.dart';
import './constants.dart';

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
    return Consumer<PageState>(
      builder: (context, pageState, child) {
        // Find the active page from the pageItems list
        final activePage = pageItems.firstWhere(
          (item) => item['title'] == pageState.activePage,
          orElse: () => pageItems[0], // Default to Home page
        );

        return MaterialApp(
          title: 'Company X',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            body: Stack(
              children: [
                BackgroundImage(
                  imageUrl: activePage['imageUrl']!,
                ),
                const NavBar(),
                const HomePageContent(),
              ],
            ),
          ),
        );
      },
    );
  }
}
