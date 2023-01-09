import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

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
                Container(
                  //color: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.black),
                    ),
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
                          'Total :',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          '\$ ${value.totalAmt} ',
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
                    onTap: (() {}),
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
