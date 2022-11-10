import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                iconSize: 5,
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 5,
                icon: const Icon(
                  Icons.favorite_outline,
                ),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: Colors.black38,
          title: Text(title, textAlign: TextAlign.center),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ));
  }
}
