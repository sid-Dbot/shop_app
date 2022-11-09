import 'package:flutter/material.dart';
import 'package:shop_app/Models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> savedProducts = [
    Product(
      id: 'p1',
      title: 'Hammer',
      description: "A tool use to smash things.",
      price: 0.99,
      imageUrl:
          'https://www.shutterstock.com/image-photo/close-orange-iron-hammer-medium-260nw-1937103445.jpg',
    ),
    Product(
        id: 'p2',
        title: 'Fishing Net',
        description: 'Used for fishing. Applicable in large water bodies.',
        price: 2.3,
        imageUrl:
            'https://img.freepik.com/free-photo/fishing-nets_181624-31810.jpg?size=626&ext=jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: savedProducts.length,
        gridDelegate: , itemBuilder: (context, index) {
          return 
          
        },),
    );
  }
}
