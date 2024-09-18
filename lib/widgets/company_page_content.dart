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
            (constraints.maxWidth * 0.02).clamp(15.0, 20.0);

        double horizontalSpacing = constraints.maxWidth * 0.07;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use Wrap to handle overflow and ensure items wrap to a new line
              Wrap(
                alignment: WrapAlignment.center,
                spacing: horizontalSpacing,
                children: [
                  // Map through the textItems list to generate the text widgets
                  ...textItems.map((item) => SizedBox(
                        width: 160, // Fixed width for each text box
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
