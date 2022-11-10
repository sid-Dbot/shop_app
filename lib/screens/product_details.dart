import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  // final String title;

  // const ProductDetails({required this.title});

  static const routename = '/product_details';

  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text('title')),
    );
  }
}
