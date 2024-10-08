import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String imageUrl;
  final String text;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.text,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isHovered = false; // Track whether the card is hovered

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;
        double vw = screenWidth / 100;
        double cardSize = (20 * vw)
            .clamp(130.0, double.infinity); // Minimum size of 130 pixels
        double margin = 2 * vw;
        double textFontSize = (2 * vw).clamp(15, 40.0);

        return MouseRegion(
          onEnter: (_) =>
              setState(() => _isHovered = true), // Mouse enters the card
          onExit: (_) =>
              setState(() => _isHovered = false), // Mouse leaves the card
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300), // Smooth transition
            opacity: screenWidth < 600
                ? 1.0
                : (_isHovered
                    ? 1.0
                    : 0.75), // Full opacity if screen width < 600
            child: Container(
              width: cardSize,
              height: cardSize,
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // Stretch to fill space
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      widget.imageUrl,
                      width: cardSize,
                      height:
                          cardSize * 0.75, // Use 75% of the Containers height
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: textFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
