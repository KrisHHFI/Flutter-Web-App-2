import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
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

  // Define the social media icon paths and URLs in a map
  final List<Map<String, String>> socialIcons = [
    {
      'icon': 'images/CameraIconWhite.png',
      'url': 'https://www.shutterstock.com/g/Kristopher+Pepper?rid=263519982',
    },
    {
      'icon': 'images/GitHubWhite.png',
      'url': 'https://github.com/KrisHHFI',
    },
    {
      'icon': 'images/LinkedInWhite.png',
      'url': 'https://www.linkedin.com/in/kristopher-pepper-824184136/',
    },
  ];

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
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width *
                                  0.02), // 2vw padding
                          child: GestureDetector(
                            onTap: () {
                              // Handle navigation item tap if needed
                            },
                            child: Text(
                              item,
                              style: const TextStyle(color: Colors.white),
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
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GestureDetector(
                              onTap: () {
                                // Handle navigation item tap if needed
                              },
                              child: Text(
                                item,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      24, // Larger font size for better visibility
                                ),
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
