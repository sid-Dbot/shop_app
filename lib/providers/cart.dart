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
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmt {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void removeSingleItem(String productID) {
    if (!_items.containsKey(productID)) {
      return;
    }
    if (_items[productID]!.quantity > 1) {
      _items.update(
          productID,
          (product) => CartItem(
              id: productID,
              name: product.name,
              price: product.price,
              quantity: product.quantity - 1));
    } else {
      _items.remove(productID);
    }
    notifyListeners();
  }

  void addToCart(String productId, double price, String name) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              name: value.name,
              price: value.price,
              quantity: value.quantity + 1));
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

  void removeItem(String productID) {
    _items.remove(productID);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

  notifyListeners();
}
