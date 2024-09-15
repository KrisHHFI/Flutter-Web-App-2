import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../constants.dart'; // Import the constants file
import '../provider/page_state.dart'; // Update import path

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  // Track whether the menu is expanded or not
  bool isMenuOpen = false;

  // Function to launch URL in a new tab
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode.externalApplication); // Open in a new tab
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);

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
            color: const Color.fromRGBO(0, 0, 0, 0.2),
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
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
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
                    ),
                  )
                else
                  Row(
                    children: navItems.map((item) {
                      bool isActive = pageState.activePage == item;
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width *
                                  0.02), // 2vw padding
                          child: GestureDetector(
                            onTap: () {
                              pageState.setActivePage(item);
                              // Handle navigation item tap if needed
                            },
                            child: Stack(
                              children: [
                                // The underline
                                if (isActive)
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                // The text
                                Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
              color: const Color.fromRGBO(
                  0, 0, 0, 0.2), // Darker background for overlay effect
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Navigation Links
                  Column(
                    children: [
                      ...navItems.map((item) {
                        bool isActive = pageState.activePage == item;
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GestureDetector(
                              onTap: () {
                                pageState.setActivePage(item);
                                // Handle navigation item tap if needed
                              },
                              child: Stack(
                                children: [
                                  // The underline
                                  if (isActive)
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                  // The text
                                  Text(
                                    item,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                          height: 100), // Additional space before social icons
                    ],
                  ),
                  // Social Media Icons
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: socialIcons.map((social) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: GestureDetector(
                              onTap: () => _launchURL(social['url']!),
                              child: Image.network(
                                social['icon']!,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
