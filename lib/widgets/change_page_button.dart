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
            width: 225,
            decoration: BoxDecoration(
              border: Border.all(
                color: _isHovered ? Colors.white : Colors.white,
              ),
              color: _isHovered ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Center(
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  fontSize: 20,
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
