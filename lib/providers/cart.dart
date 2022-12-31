import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class CartItem {
  String name;
  double price;
  int quantity;
  String id;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  int get itemCount {
    return _items.length;
  }

  void addToCart(String productId, double price, String name) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              name: value.name,
              price: value.price,
              quantity: value.quantity));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                name: name,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }
}
