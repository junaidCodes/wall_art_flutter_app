import 'package:flutter/material.dart';

class OnBoardSliderProvider with ChangeNotifier {
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void nextPage() {
    currentIndex++;
    notifyListeners();
  }
}
