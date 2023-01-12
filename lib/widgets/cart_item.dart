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
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Padding(
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'x $quantity',
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(children: [
                    Text(
                      '$price',
                      style: TextStyle(fontSize: 25),
                    ),
                  ]),
                ]),
          ),
        ),
      ),
    );
  }
}
