import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  String title;
  int quantity;
  double price;
  String id;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(8),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context).removeItem(id);
      },
      child: Card(
        elevation: 9,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  '\$$price',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              title: Text(
                title,
                style: TextStyle(fontSize: 25),
              ),
              subtitle: Text(
                'x $quantity',
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text(
                'Total:\$${price * quantity}',
                style: TextStyle(fontSize: 20),
              ),
            )),
      ),
    );
  }
}
