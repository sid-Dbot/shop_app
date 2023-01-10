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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(2, 4),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(title),
          Text('x $quantity'),
          Row(children: [
            Text('$price'),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ]),
        ]),
      ),
    );
  }
}
