import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int number = 1;
  void increase() {
    number++;
    notifyListeners();
  }

  void decraese() {
    if (number > 1) {
      number--;
    }
    notifyListeners();
  }
}
