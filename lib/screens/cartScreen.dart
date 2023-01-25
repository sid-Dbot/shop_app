import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/orders.dart';

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your Cart")),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Consumer<Cart>(builder: (context, value, child) {
            return Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Text('S.No'),
                //     Text('Product'),
                //     Text('Quantity'),
                //     Text('Price'),
                //   ],
                // ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.black),
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.itemCount,
                    itemBuilder: (context, index) {
                      return CartItem(
                          id: value.items.keys.toList()[index],
                          title: value.items.values.toList()[index].name,
                          price: value.items.values.toList()[index].price,
                          quantity:
                              value.items.values.toList()[index].quantity);
                    },
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Grand Total :',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          '\$ ${value.totalAmt.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  child: GestureDetector(
                    onTap: (() {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Confirm order?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Provider.of<OrdersList>(context,
                                            listen: false)
                                        .addOrder(
                                            DateTime.now().toString(),
                                            value.items.values.toList(),
                                            DateTime.now(),
                                            value.totalAmt);
                                    value.clearCart();
                                  },
                                  child: Text('Yes!')),
                              TextButton(onPressed: () {}, child: Text('No!'))
                            ],
                          );
                        },
                      );
                    }),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(2, 4))
                          ],
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Check Out',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ));
  }
}
