import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/page_state.dart';

class ChangePageButton extends StatelessWidget {
  final String buttonText;
  final String pageToChangeTo;

  const ChangePageButton({
    required this.buttonText,
    required this.pageToChangeTo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: OutlinedButton(
        onPressed: () {
          Provider.of<PageState>(context, listen: false)
              .setActivePage(pageToChangeTo);
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
