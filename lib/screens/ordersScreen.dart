import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:shop_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      body: Consumer<OrdersList>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.orders.length,
          itemBuilder: (context, index) {
            return OrderItem(index: index);
          },
        );
      }),
    );
  }
}
