import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  var _expand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      body: Consumer<OrdersList>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.orders.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 9,
                child: ListTile(
                  leading: Text(DateFormat.yMMMd()
                      .add_jm()
                      .format(value.orders[index].orderDate)
                      .toString()),
                  title: Text('\$ ${value.orders[index].total}'),
                  subtitle: Text('Order ${index + 1}'),
                  trailing: Icon(Icons.arrow_drop_down),
                ));
          },
        );
      }),
    );
  }
}
