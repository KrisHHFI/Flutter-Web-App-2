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
  ChangePageButtonState createState() => ChangePageButtonState();
}

class ChangePageButtonState extends State<ChangePageButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double vh = MediaQuery.of(context).size.height / 100;
    double vw = MediaQuery.of(context).size.width / 100;
    double textFontSize = (3 * vw).clamp(15, 20.0);
    double topPadding = 2 * vh;
    double buttonVerticalPadding = 2 * vh;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            Provider.of<PageState>(context, listen: false)
                .setActivePage(widget.pageToChangeTo);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: _isHovered ? Colors.white : Colors.white,
              ),
              color: _isHovered ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: buttonVerticalPadding),
            child: Center(
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  fontSize: textFontSize,
                  color: _isHovered ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
