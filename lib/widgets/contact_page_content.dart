import 'dart:math' as math; // Import the math library for max function
import 'package:flutter/material.dart';
import './change_page_button.dart';

class ContactPageContent extends StatelessWidget {
  const ContactPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine a scalable font size with min and max limits for the form title
        double fontSize = (constraints.maxWidth * 0.08).clamp(30.0, 50.0);

        // Set the container width to 30vw or a minimum of 350 pixels
        double containerWidth = math.max(constraints.maxWidth * 0.3, 350.0);

        return Center(
          child: Container(
            width:
                containerWidth, // Set the width to 30vw or 350px, whichever is larger
            padding:
                const EdgeInsets.all(16.0), // Add padding for internal spacing
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Form for Name, Email, Company, and Message
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Name field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name*',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16), // Space between fields

                      // Email field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email*',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      // Company field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Company',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),

                      // Message field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Message*',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        style: const TextStyle(color: Colors.white),
                        maxLines: 2, // Multi-line text field for the message
                      ),
                      const SizedBox(height: 20),

                      const ChangePageButton(
                        buttonText: 'Submit',
                        pageToChangeTo: 'Contact',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
