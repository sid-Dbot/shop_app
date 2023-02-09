import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/product_details.dart';

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
        color: Colors.red.shade800,
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
        Provider.of<Cart>(context, listen: false).removeItem(id);
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/product_details', arguments: id);
        },
        child: Card(
          elevation: 9,
          color: Colors.grey,
          child: Container(
            child: ListTile(
              contentPadding: EdgeInsets.all(-1),
              visualDensity: VisualDensity.comfortable,
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
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Consumer<Cart>(builder: (context, value, child) {
                return Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          value.removeSingleItem(id);
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red.shade900,
                        )),
                    Text(
                      'x $quantity',
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                        onPressed: () {
                          value.addToCart(id, price, title);
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue[900],
                        )),
                  ],
                );
              }),
              trailing: Text(
                'Total:\$${(price * quantity).toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
