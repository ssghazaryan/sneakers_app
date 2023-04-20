import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool ukSize = true;
  int? selectedIndex;

  void changeUkSize(bool val) {
    ukSize = val;
    notifyListeners();
  }

  void setSelectedIndex(int? index) {
    selectedIndex = index;
    notifyListeners();
  }
}
