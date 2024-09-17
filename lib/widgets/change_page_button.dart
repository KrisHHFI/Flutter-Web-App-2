import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/page_state.dart';

class ChangePageButton extends StatefulWidget {
  final String buttonText;
  final String pageToChangeTo;

  const ChangePageButton({
    required this.buttonText,
    required this.pageToChangeTo,
    super.key,
  });

  @override
  _ChangePageButtonState createState() => _ChangePageButtonState();
}

class _ChangePageButtonState extends State<ChangePageButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double verticalPadding = MediaQuery.of(context).size.height * 0.02;

    return Padding(
      padding: EdgeInsets.only(top: verticalPadding),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: OutlinedButton(
          onPressed: () {
            Provider.of<PageState>(context, listen: false)
                .setActivePage(widget.pageToChangeTo);
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: _isHovered ? Colors.white : Colors.white),
            backgroundColor: _isHovered ? Colors.white : Colors.transparent,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          ),
          child: Text(
            widget.buttonText,
            style: TextStyle(
              fontSize: 20,
              color: _isHovered
                  ? Colors.black
                  : Colors.white, // Text color changes on hover
            ),
          ),
        ),
      ),
    );
  }
}
