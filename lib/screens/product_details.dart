import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';

class ProductDetails extends StatelessWidget {
  static const routename = '/product_details';

  @override
  Widget build(BuildContext context) {
    final productDetails = Provider.of<Products>(context).items;
    final productid = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('title')),
    );
  }
}
