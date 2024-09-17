import 'package:flutter/material.dart';
import '../constants.dart';
import './change_page_button.dart';

class CompanyPageContent extends StatelessWidget {
  const CompanyPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double mainTextfontSize =
            (constraints.maxWidth * 0.02).clamp(50.0, 70.0);

        double subTextfontSize =
            (constraints.maxWidth * 0.02).clamp(15.0, 30.0);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use Wrap instead of Row to handle overflow
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20.0, // Horizontal space between items
                runSpacing: 20.0, // Vertical space between lines
                children: [
                  // Map through the textItems list to generate the text widgets
                  ...textItems.map((item) => Container(
                        width: constraints.maxWidth *
                            0.25, // Adjust width as needed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item['mainText']!,
                              style: TextStyle(
                                fontSize: mainTextfontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['subText']!,
                              style: TextStyle(
                                fontSize: subTextfontSize,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 20), // Space between text and button
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
