import 'package:flutter/material.dart';
import './change_page_button.dart';

class HomePageContent extends StatelessWidget {
  final String centeredText = "We believe in a better future";

  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double vw = MediaQuery.of(context).size.width / 100;
        double fontSize = (8 * vw).clamp(50.0, 70.0);

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
