import 'package:flutter/material.dart';

class PageState extends ChangeNotifier {
  String _activePage = 'Home';

  String get activePage => _activePage;

  void setActivePage(String page) {
    _activePage = page;
    notifyListeners();
  }
}
