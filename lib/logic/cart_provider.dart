import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CartScreenProvider extends ChangeNotifier {
  /// ----
  List<CartItem> cartItems = [];
  int totalCount = 0;

  void addItemToCart(CartItem item) {
    cartItems.add(item);
    totalCount++;
    notifyListeners();
  }

  void incrementDecrement(bool increment, String itemId) {
    final item = cartItems.firstWhere((element) => element.id == itemId);

    if (increment) {
      item.count++;
      totalCount++;
    } else {
      if (item.count > 1) {
        item.count--;
        totalCount--;
      } else {
        cartItems.removeWhere(
          (element) => element.id == itemId,
        );
        totalCount--;
      }
    }
    notifyListeners();
  }
}
