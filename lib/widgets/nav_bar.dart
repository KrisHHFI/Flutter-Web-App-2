import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // Track whether the menu is expanded or not
  bool isMenuOpen = false;

  // Define the nav items in a list
  final List<String> navItems = [
    'Home',
    'Company',
    'Services',
    'References',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    // Determine the logo image based on screen width
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    String logo =
        isSmallScreen ? 'images/XLogo.png' : 'images/XLogoCompany.png';

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  logo,
                  height: 30,
                  fit: BoxFit.contain,
                ),
                if (isSmallScreen)
                  // Hamburger menu icon
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle menu visibility when tapped
                        isMenuOpen = !isMenuOpen;
                      });
                    },
                    child: Image.network(
                      'images/Menu.png',
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  )
                else
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
          // Display the full-screen menu below the NavBar when the menu is open
          if (isMenuOpen && isSmallScreen)
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height, // Full height
              color: Colors.black, // Darker background for overlay effect
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: navItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Larger font size for better visibility
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
