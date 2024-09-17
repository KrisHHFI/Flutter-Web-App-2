import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/page_state.dart';

class CompanyPageContent extends StatelessWidget {
  const CompanyPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine a scalable font size with min and max limits
        double fontSize = (constraints.maxWidth * 0.08).clamp(50.0, 70.0);

        // Define the text data in a list
        final textItems = [
          {
            'mainText': '25+',
            'subText': 'years in business',
          },
          {
            'mainText': '200+',
            'subText': 'satisfied customers',
          },
          {
            'mainText': '€3.4bn',
            'subText': 'net sales',
          },
          {
            'mainText': '~6',
            'subText': 'contintents',
          },
        ];

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Map through the textItems list to generate the text widgets
              ...textItems.map((item) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
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
              const SizedBox(height: 20), // Space between text and button
              OutlinedButton(
                onPressed: () {
                  // Change the active page to "Company"
                  Provider.of<PageState>(context, listen: false)
                      .setActivePage('Services');
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                ),
                child: const Text(
                  'Interested?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
