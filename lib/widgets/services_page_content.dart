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
                  CustomCard(
                    imageUrl:
                        'images/CargoShip.jpg', // Credit: Pexels, Martin Damboldt, Photography of Ship
                    text: 'Lorem ipsum dolor sit amet, consectetur.',
                  ),
                  CustomCard(
                    imageUrl:
                        'images/Engineers.jpg', // Credit: Pexels, Anamul Rezwan, Two Man Holding White Paper
                    text: 'Duis aute irure dolor in reprehenderit in.',
                  ),
                  CustomCard(
                    imageUrl:
                        'images/Consultants.jpg', // Credit: Pexels, Sora Shimazaki, Ethnic businessman shaking hand of applicant in office
                    text: 'Lorem ipsum dolor sit amet, consectetur.',
                  ),
                  CustomCard(
                    imageUrl:
                        'images/OfficePeople.jpg', // Credit: Pexels, LinkedIn Sales Navigator, Man Pointing Laptop Computer
                    text: 'Duis aute irure dolor in reprehenderit in.',
                  ),
                ],
              ),
              const ChangePageButton(
                buttonText: 'Check our references',
                pageToChangeTo: 'References',
              ),
            ],
          ),
        );
      },
    );
  }
}
