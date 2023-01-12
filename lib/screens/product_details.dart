import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';

class ProductDetails extends StatelessWidget {
  //static const routename = '/product_details';

  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context)!.settings.arguments as String;
    final choosenProduct = Provider.of<Products>(context).findbyid(productid);

    return Scaffold(
      appBar: AppBar(title: Text(choosenProduct.title)),
      body: Column(children: [
        Container(
          height: 300,
          child: Card(
            child: Image.network(choosenProduct.imageUrl),
            elevation: 9,
          ),
        ),
        Text(
          '\$${choosenProduct.price}',
          style: TextStyle(fontSize: 25),
        ),
        Text(choosenProduct.description)
      ]),
    );
  }
}
