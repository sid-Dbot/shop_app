import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../Models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: Consumer<Products>(
        builder: (context, value, child) => GridView.builder(
          padding: const EdgeInsets.all(7),
          itemCount: value.items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5 / 4,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
          ),
          itemBuilder: (context, index) {
            return ChangeNotifierProvider(
              create: (context) => productData[index],
              child: ProductItem(),
            );
          },
        ),
      ),
    );
  }
}
