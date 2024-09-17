import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/page_state.dart';
import './change_page_button.dart';

class HomePageContent extends StatelessWidget {
  final String centeredText = "We believe in a better future";

  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine a scalable font size with min and max limits
        double fontSize = (constraints.maxWidth * 0.08).clamp(50.0, 70.0);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  centeredText,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const ChangePageButton(
                buttonText: 'Learn more',
                pageToChangeTo: 'Company',
              ),
            ],
          ),
        );
      },
    );
  }
}
