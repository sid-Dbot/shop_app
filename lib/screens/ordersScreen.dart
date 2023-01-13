import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      body: Consumer<OrdersList>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.orders.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                    elevation: 9,
                    child: ListTile(
                      leading: Text(DateFormat.yMMMd()
                          .add_jm()
                          .format(value.orders[index].orderDate)
                          .toString()),
                      title: Text('\$ ${value.orders[index].total}'),
                      subtitle: Text('Order ${index + 1}'),
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
                          value.orders[index].cartList.length * 20.0 + 50, 100),
                      child: ListView(
                          children: value.orders[index].cartList.map((items) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              items.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              'x${items.quantity}',
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        );
                      }).toList())),
              ],
            );
          },
        );
      }),
    );
  }
}
