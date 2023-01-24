import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';
import 'package:shop_app/widgets/your_product.dart';

class YourProducts extends StatelessWidget {
  const YourProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Your products',
      )),
      body: Consumer<Products>(builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.items.length,
          itemBuilder: (context, index) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(17)),
              child: Card(
                  elevation: 9,
                  child: YourProduct(
                      imgUrl: value.items[index].imageUrl,
                      name: value.items[index].title)),
            );
          },
        );
      }),
    );
  }
}
