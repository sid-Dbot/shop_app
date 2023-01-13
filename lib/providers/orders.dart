import 'package:flutter/material.dart';

import '../providers/cart.dart';

class Order {
  final String orderID;
  List<CartItem> cartList;
  final DateTime orderDate;
  double total;

  Order({
    required this.orderID,
    required this.cartList,
    required this.total,
    required this.orderDate,
  });
}

class OrdersList {
  List _orders = [];
  List get orders {
    return [..._orders];
  }
}
