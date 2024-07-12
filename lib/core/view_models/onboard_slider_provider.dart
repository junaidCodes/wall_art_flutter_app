import 'package:flutter/material.dart';

class OnBoardSliderProvider with ChangeNotifier {
  int currentIndex = 0;

  bool hideSkip = false;

  void setCurrentIndex(int index) {
    currentIndex = index;
    // bool hideSkip = false;
    notifyListeners();
  }

  void nextPage() {
    currentIndex++;
    notifyListeners();
  }
}
