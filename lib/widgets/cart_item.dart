import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

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
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  '$price',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              title: Text(
                title,
                style: TextStyle(fontSize: 25),
              ),
              subtitle: Text(
                'x $quantity',
                style: TextStyle(fontSize: 25),
              ),
              trailing: Text(
                'Total: ${price * quantity}',
                style: TextStyle(fontSize: 25),
              ),
            )),
      ),
    );
  }
}
