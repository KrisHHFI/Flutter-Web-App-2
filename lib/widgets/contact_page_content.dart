import 'dart:math' as math;
import 'package:flutter/material.dart';
import './change_page_button.dart';

class ContactPageContent extends StatelessWidget {
  const ContactPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double vh = MediaQuery.of(context).size.height / 100;
        double vw = MediaQuery.of(context).size.width / 100;
        double containerWidth = math.max(30 * vw, 350.0);
        double verticalPadding = 2 * vh;

        return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50.0),
            width: containerWidth,
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
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: verticalPadding),

                      // Email field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email*',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: verticalPadding),

                      // Company field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Company',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: verticalPadding),

                      // Message field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Message*',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                        ),
                        style: const TextStyle(color: Colors.white),
                        maxLines: 2, // Multi-line text field for the message
                      ),

                      const Center(
                        child: ChangePageButton(
                          buttonText: 'Submit',
                          pageToChangeTo: 'Contact',
                        ),
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
