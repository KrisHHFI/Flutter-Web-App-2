import 'package:flutter/material.dart';
import '../constants.dart';
import './change_page_button.dart';

class CompanyPageContent extends StatelessWidget {
  const CompanyPageContent({super.key});

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
              // Wrap the Row in a SingleChildScrollView for horizontal scrolling if needed
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Map through the textItems list to generate the text widgets
                    ...textItems.map((item) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: constraints.maxWidth *
                              0.25, // Adjust width as needed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['mainText']!,
                                style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item['subText']!,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              const ChangePageButton(
                buttonText: 'Interested?',
                pageToChangeTo: 'Services',
              ),
            ],
          ),
        );
      },
    );
  }
}
