import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../providers/orders.dart';

class OrderItem extends StatefulWidget {
  int index;
  OrderItem({required this.index});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expand = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersList>(
      builder: (context, value, child) {
        return Column(
          children: [
            Card(
                elevation: 9,
                child: ListTile(
                  leading: Text(DateFormat.yMMMd()
                      .add_jm()
                      .format(value.orders[widget.index].orderDate)
                      .toString()),
                  title: Text(
                      '\$ ${value.orders[widget.index].total.toStringAsFixed(2)}'),
                  subtitle: Text('Order ${widget.index + 1}'),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        _expand = !_expand;
                      });
                    },
                  ),
                )),
            if (_expand)
              Container(
                  height: min(
                      value.orders[widget.index].cartList.length * 20.0 + 20,
                      100),
                  child: ListView(
                      children:
                          value.orders[widget.index].cartList.map((items) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          items.name,
                        ),
                        Text(
                          'x${items.quantity}',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '\$ ${items.price * items.quantity}',
                        )
                      ],
                    );
                  }).toList())),
          ],
        );
      },
    );
  }
}
