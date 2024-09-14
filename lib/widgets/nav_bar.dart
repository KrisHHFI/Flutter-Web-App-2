import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the nav items in a list
    final List<String> navItems = [
      'Home',
      'Company',
      'Services',
      'References',
      'Contact'
    ];

    // Determine the logo image based on screen width
    String logo = MediaQuery.of(context).size.width < 600
        ? 'images/XLogo.png'
        : 'images/XLogoCompany.png';

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: const Color.fromRGBO(0, 0, 0, 0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              logo,
              height: 30,
              fit: BoxFit.contain,
            ),
            Row(
              children: navItems.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width *
                          0.02), // 2vw padding
                  child: Text(
                    item,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
