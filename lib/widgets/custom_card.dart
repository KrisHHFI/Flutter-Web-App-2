import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String text;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth <= 600;
        final textFontSize = isSmallScreen ? 25.0 : 30.0;

        return Container(
          width: 350, // Set fixed width for each card
          height: 350,
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            border: Border.all(color: Colors.grey, width: 1.0), // Border
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  imageUrl,
                  width: 350,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: textFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
