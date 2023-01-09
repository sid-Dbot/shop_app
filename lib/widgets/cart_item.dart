import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class CartItem extends StatelessWidget {
  String title;
  int quantity;
  double price;
  int id;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 11,
      child: ListTile(
        title: Text(title),
        subtitle: Text('x $quantity'),
        trailing: Row(children: [
          Text('$price'),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete))
        ]),
      ),
    );
  }
}
