import 'package:flutter/material.dart';
import 'package:shop_app/Models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
 
  final List<Product> savedProducts={
    Product(id: p1.toString(),title: 'Hammer',description: "A tool use to smash things.",price: 0.99,imageUrl: 'https://www.shutterstock.com/image-photo/close-orange-iron-hammer-medium-260nw-1937103445.jpg',)

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
