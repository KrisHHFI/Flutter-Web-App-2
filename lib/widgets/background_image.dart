import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackgroundImage extends StatelessWidget {
  final String imageUrl;

  const BackgroundImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = MediaQuery.of(context).size.width;

        return Image.network(
          imageUrl,
          width: screenWidth, // 100vw
          fit: BoxFit.cover, // height auto
        );
      },
    );
  }
}
