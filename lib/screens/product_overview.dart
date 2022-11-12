import 'package:flutter/material.dart';
import 'package:shop_app/Models/product.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> savedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: savedProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
              id: savedProducts[index].id,
              title: savedProducts[index].title,
              imageUrl: savedProducts[index].imageUrl);
        },
      ),
    );
  }
}
