import 'package:flutter/material.dart';
import '../constants.dart';
import './change_page_button.dart';
import './custom_card.dart';

class ServicesPageContent extends StatelessWidget {
  const ServicesPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double mainTextfontSize =
            (constraints.maxWidth * 0.02).clamp(50.0, 70.0);
        double subTextfontSize =
            (constraints.maxWidth * 0.02).clamp(15.0, 20.0);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: services.map((service) {
                  return CustomCard(
                    imageUrl: service['imageUrl']!,
                    text: service['text']!,
                  );
                }).toList(),
              ),
              const ChangePageButton(
                buttonText: 'Want to know more?',
                pageToChangeTo: 'Contact',
              ),
            ],
          ),
        );
      },
    );
  }
}
