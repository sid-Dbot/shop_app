import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: productData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
        ),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider(
            create: (context) => productData[index],
            child: ProductItem(
                // id: productData[index].id,
                // title: productData[index].title,
                // imageUrl: productData[index].imageUrl),
          );
        },
      ),
    );
  }
}
