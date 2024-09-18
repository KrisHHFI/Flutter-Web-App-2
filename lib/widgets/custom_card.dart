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
        double textFontSize = (constraints.maxWidth * 0.012).clamp(12.5, 20.0);

        // Get screen width in vw units (20vw)
        double vw = MediaQuery.of(context).size.width / 100;
        double cardSize =
            (20 * vw).clamp(160.0, double.infinity); // Minimum size of 160
        double margin = 2 * vw;
        double padding = 0.25 * vw;

        return Container(
          width: cardSize, // Set width with minimum of 160
          height: cardSize, // Set height with minimum of 160
          margin: EdgeInsets.all(margin),
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
                  width: cardSize,
                  height:
                      cardSize * 0.75, // Maintain aspect ratio for the image
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
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
